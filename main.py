from flask import Flask, render_template, request, session, redirect, flash, make_response
from flask_mysqldb import MySQL
from datetime import datetime
import json
import os
from werkzeug.utils import secure_filename
from flask_mail import Mail
import math




with open('configs.json', 'r') as f:
    params = json.load(f)['parameters']



app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_user'],
    MAIL_PASSWORD = params['gmail_password']
)
mail = Mail(app)

app.config['MYSQL_HOST'] = params['MYSQL_HOST']
app.config['MYSQL_USER'] = params['MYSQL_USER']
app.config['MYSQL_PASSWORD'] = params['MYSQL_PASSWORD']
app.config['MYSQL_DB'] = params['MYSQL_DB']

mysql = MySQL(app)



# home page

@app.route("/")
def home():
    # fetching posts
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM posts")
    posts = cur.fetchall()

    #pagination
    last = math.ceil(len(posts) / int(params['no_of_posts']))

    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']) : (page-1)*int(params['no_of_posts']) + int(params['no_of_posts']) ]

    #for first page
    if (page == 1):
        previous = ""
        next = "/?page=" + str(page + 1)
    elif (page == last):
        previous = "/?page=" + str(page - 1)
        next = ""
    else:
        previous = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)
    print(posts)

    return render_template('index.html', params=params, posts=posts, previous=previous, next=next)




# blog post page

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM posts WHERE slug = %s", [post_slug])
    post = cur.fetchone()
    return render_template('post.html', params=params, post=post)


# about page

@app.route("/about")
def about():
    return render_template('about.html', params=params)



# contact page

@app.route("/contact",  methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        user_details = request.form
        name = user_details['name']
        email = user_details['email']
        phone_num = user_details['phone_num']
        msg = user_details['msg']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO contacts(name, email, phone_num, msg, time) VALUES (%s, %s, %s, %s, %s)",
                    (name, email, phone_num, msg, datetime.now()))
        mysql.connection.commit()
        cur.close()
        mail.send_message('New msg from 9to6coding',
                          sender=email,
                          recipients=[params['gmail_user']],
                          body="Name: " + name + "\n" + "Email: " + email + "\n" + "Phone Number: "+ phone_num + "\n" + "******" +"\n" + msg
                          )
        flash("Your message successfuly sent. We will connect shortly.", 'info')
    return render_template('contact.html', params=params)



# login/dashboard Page

@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']):
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM posts")
        post = cur.fetchall()
        return render_template('dashboard.html', params=params, post=post)

    if request.method == 'POST':
        user_name = request.form.get('user_name')
        user_password = request.form.get('user_password')
        if (user_name == params['admin_user'] and user_password == params['admin_password']):
            session['user'] = user_name
            cur = mysql.connection.cursor()
            cur.execute("SELECT * FROM posts")
            post = cur.fetchall()
            return render_template('dashboard.html', params=params, post=post)
        else:
            return render_template('login.html', params=params)

    return render_template('login.html', params=params)





#logout page

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('dashboard')



# Blog post edit page

@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            slug = request.form.get('slug')
            meta_title = request.form.get('meta_title')
            meta_description = request.form.get('meta_description')
            title = request.form.get('title')
            content = request.form.get('content')
            post_date = datetime.now()
            img_file =request.form.get('img_file')

            if sno == '0':
                # post = posts(title=title, slug=slug, content=content, img_file=img_file)
                cur = mysql.connection.cursor()
                cur.execute("INSERT INTO posts(slug, meta_title, meta_description, title, content, post_date, img_file) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                            (slug, meta_title, meta_description, title, content, post_date, img_file))
                mysql.connection.commit()
                cur.close()
                flash("New Blog Post Added Successfuly.", 'info')
            else:
                cur = mysql.connection.cursor()
                cur.execute("UPDATE posts SET slug=%s, meta_title=%s, meta_description=%s, title=%s, content=%s, img_file=%s WHERE sno = %s", (slug, meta_title, meta_description,title, content, img_file, sno))
                mysql.connection.commit()
                flash(f"Blog Post Updated Successfuly. Post url: {slug}", 'info')
                return redirect('/edit/' + sno)
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM posts WHERE sno = %s", [sno])
        post = cur.fetchone()
        return render_template('edit.html', params=params, post=post, sno=sno)



# File uploader

@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == 'POST'):
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            flash("File Uploaded Successfuly", 'info')
            return redirect('/dashboard')


# delete blog post

@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM posts WHERE sno = %s", [sno])
        mysql.connection.commit()
        flash("Post Deleted Successfuly.", 'danger')
    return redirect('/dashboard')


# xml sitemap page

@app.route('/sitemap.xml')
def sitemap():
    cur = mysql.connection.cursor()
    cur.execute("SELECT slug FROM posts")
    articles = cur.fetchall()
    response = make_response(render_template('sitemap.xml', articles=articles, base_url="https://9to6coding.com"))
    response.headers['Content-Type'] = 'application/xml'
    return response



# robots.txt

@app.route('/robots.txt')
def robots():
    response = make_response(render_template('robots.txt'))
    response.headers['Content-Type'] = 'application/txt'
    return response



# error handling

@app.errorhandler(404)
def error404(error):
    return render_template('404.html', params=params), 404

@app.errorhandler(403)
def error403(error):
    return render_template('403.html', params=params), 403


@app.errorhandler(500)
def error500(error):
    return render_template('500.html', params=params), 500









if __name__ == '__main__':
    app.run(debug=True)