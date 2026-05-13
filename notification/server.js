const express = require('express');
const app = express();
const port = 4000;

app.use(express.json());

app.post('/api/notify', (req, res) => {
  console.log("--> Sending notification for new order!");
  res.json({
    status: 'success',
    message: 'Notification email sent to user.'
  });
});

app.get('/health', (req, res) => {
  res.json({ status: "Notification Service is healthy!" });
});

app.listen(port, () => {
  console.log(`Notification service listening on port ${port}`);
});
