<!doctype html>
<html>
  <head>
    <title>Places</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  </head>

  <body>

    <table>
      <thead>
        <tr>
          <th>Place Name</th>
          <th>Review</th>
        </tr>
      </thead>
      <tbody>
        {{range $key, $val := .places}}
          <tr>
            <form id="modify" method="post" action="/place/{{$val.Id}}">
              <td>
                <a href="/place/{{$val.Id}}">{{$val.Name}}</a>
                <input type="hidden" name="Name" value="{{$val.Name}}" />
              </td>
              <td>
                <input name="Review" type="text" value="{{$val.Review}}">
              </td>
              <td>
                <input type="hidden" name="Id" value="{{$val.Id}}" />
                <input type="hidden" name="_method" value="put" />
                <button type="button" onclick="edit()">Edit</button>
                <button type="button" onclick="remove()">Remove</button>
              </td>
            </form>
          </tr>
        {{end}}
      </tbody>
    </table>

    <form id="new" method="post" action="/place">
      <input name="Name" type="text">
      <input name="Review" type="text">
      <input name="Id" type="hidden" value="9"><!-- @todo -->

      <!-- <input name="jsondata" type="hidden"> -->
      <!-- <button type="button" onclick="create()">Create</button> -->

      <input type="submit" value="Create">
    </form>

    <script>
      function edit()
      {
        $("form#modify input[name=_method]").val('put');
        $("form#modify").submit();
      }
      function remove()
      {
        $("form#modify input[name=_method]").val('delete');
        $("form#modify").submit();
      }

      // function create()
      // {
      //   var id = $("form#new input[name=Id]").val();
      //   var name = $("form#new input[name=Name]").val();
      //   var review = $("form#new input[name=Review]").val();

      //   var jsondata = JSON.stringify({ 
      //       "Id" : id,
      //       "Name": name,
      //       "Review": review,
      //   });

      //   $("form#new input[name=jsondata]").val(jsondata);
      //   $("form#new").submit();
      // }
    </script>

  </body>
</html>