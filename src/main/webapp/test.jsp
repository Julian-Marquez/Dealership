<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>US States and Cities Dropdown</title>
</head>
<body>
  <h2>Select a State and City</h2>

  <label for="states">State:</label>
  <select id="states">
    <option value="">-- Select State --</option>
  </select>

  <br /><br />

  <label for="cities">City:</label>
  <select id="cities" disabled>
    <option value="">-- Select City --</option>
  </select>

<script src="js/geoData.js"></script>
      <script src="js/applying.js"></script>
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

</body>
</html>

