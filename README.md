This is a forum app
- I tried adding an admin dashboard, not sure if it is all good
- The routes are nested 
- Only AdminUsers can create a forum or subforum, but they can't manage anything about threads or posts

To login as a AdminUser, you first need to create it in the db with the same params as a simple user, and after that login at admin_user/sign_in 
