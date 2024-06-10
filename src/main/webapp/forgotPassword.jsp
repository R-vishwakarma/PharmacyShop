<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
  }

  .card {
    border: none;
    border-radius: 10px;
    box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.1);
  }

  .card-body {
    padding: 30px;
  }

  .form-group label {
    font-weight: bold;
    color: #333;
  }

  .form-control {
    border: 2px solid #ddd;
    border-radius: 5px;
    transition: border-color 0.3s ease-in-out;
  }

  .form-control:focus {
    border-color: #6c63ff;
    box-shadow: none;
  }

  .btn-success {
    background-color: #6c63ff;
    border: none;
    border-radius: 5px;
    padding: 12px 30px;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease-in-out;
  }

  .btn-success:hover {
    background-color: #564bd8;
  }

  .text-muted {
    color: #777;
  }
</style>
</head>
<body>

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-6">
      <div class="card">
        <div class="card-body">
          <h3 class="mb-4 text-center">Forgot Password</h3>
          <form action="forgotPassword" method="post">
            <div class="form-group">
              <label for="email-for-pass">Enter your email address</label>
              <input class="form-control" type="email" name="email" id="email-for-pass" required>
              <small class="form-text text-muted">Enter the registered email address</small>
            </div>
            <div class="text-center">
              <button class="btn btn-success" type="submit">Get New Password</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
