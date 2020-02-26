<!doctype html>
<html>
  <head>
    <title>Places</title>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  </head>

  <body>
    {{range $key, $val := .places}}
      <div>
        <h1>{{$val.Title}}</h1>
        <p>{{$val.Body}}</p>
      </div>
    {{end}}
  </body>
</html>