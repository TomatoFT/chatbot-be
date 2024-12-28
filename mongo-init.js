db.auth('admin', 'password');

db = db.getSiblingDB('chatbotdb');

db.createUser({
  user: 'dev',
  pwd: 'dev',
  roles: [
    {
      role: 'readWrite',
      db: 'chatbotdb'
    }
  ]
});