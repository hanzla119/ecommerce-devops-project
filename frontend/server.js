const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send(`
    <html>
      <head><title>E-commerce Platform</title></head>
      <body style="font-family: Arial; padding: 50px;">
        <h1>Welcome to the E-commerce Platform!</h1>
        <p>This is the Frontend Microservice running inside a Docker container.</p>
        <hr/>
        <p><i>More microservices will be connected soon...</i></p>
      </body>
    </html>
  `);
});

app.listen(port, () => {
  console.log(`Frontend service listening at http://localhost:${port}`);
});
