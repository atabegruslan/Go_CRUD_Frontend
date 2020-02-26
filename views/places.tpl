<!doctype html>
<html>
  <head>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js'></script>
    <title>Places</title>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  </head>

  <body>
    <div>
      {{range $key, $val := .places}}
      {{$key}}
      {{$val}}
      {{end}}
    </div>
  </body>
</html>