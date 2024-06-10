<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Password</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<style>
body {
  background-color: #f8f9fa;
}

.container {
  margin-top: 50px;
}

.card {
  border: none;
  border-radius: 10px;
  box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.1);
}

.card-header {
  background-color: #6c63ff;
  border-radius: 10px 10px 0 0;
}

.card-header h1 {
  color: #fff;
  font-weight: bold;
}

.form-control {
  border: 2px solid #6c63ff;
  border-radius: 5px;
  transition: border-color 0.3s ease-in-out;
}

.form-control:focus {
  border-color: #564bd8;
  box-shadow: none;
}

.btn-info {
  background-color: #6c63ff;
  border: none;
  border-radius: 5px;
  padding: 12px 30px;
  font-size: 16px;
  font-weight: bold;
  transition: background-color 0.3s ease-in-out;
}

.btn-info:hover {
  background-color: #564bd8;
}
</style>
</head>
<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
      <div class="card">
        <div class="card-header text-center">
          <h1>Reset Password</h1>
        </div>
        <div class="card-body">
          <form action="newPassword" method="POST">
            <div class="form-group">
              <input type="text" name="password" placeholder="New Password" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" name="confPassword" placeholder="Confirm New Password" class="form-control">
            </div>
            <div class="form-group">
              <input type="submit" value="Reset" class="btn btn-info btn-block">
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
