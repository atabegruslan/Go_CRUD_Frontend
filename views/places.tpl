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
          <th> </th>
          <th> </th>
        </tr>
      </thead>
      <tbody>
        {{range $key, $val := .places}}
          <tr>
            <form>
              <td>
                <input type="hidden" name="Id" value="{{$val.Id}}" />
                <input type="text" name="Name" value="{{$val.Name}}" />
              </td>
              <td>
                <input type="text" name="Review" value="{{$val.Review}}">
              </td>
              <td>
                <a href="/place/{{$val.Id}}">View</a>
              </td>
              <td>
                <button type="button" onclick="edit(this)">Edit</button>
                <button type="button" onclick="remove(this)">Remove</button>
              </td>
            </form>
          </tr>
        {{end}}
      </tbody>
    </table>

    <form id="new" method="post" action="/place">
      <input name="Name" type="text">
      <input name="Review" type="text">
      <input name="Id" type="hidden" value="11"><!-- @todo -->

      <!-- <input name="jsondata" type="hidden"> -->
      <!-- <button type="button" onclick="create()">Create</button> -->

      <input type="submit" value="Create">
    </form>

    <script>
      function edit(src)
      {
        var id = src.form.elements[0].value;
        var formData = new FormData(src.form);

        $.ajax({
            type: 'PUT', 
            url: "/place/" + id, 
            processData: false,
            contentType: false,
            data: formData
        })
          .then(function (data) {
              console.log({data});
              location.reload();
          })
          .catch(function (err) {
              console.log({err});
          });
      }

      function remove(src)
      {
        var id = src.form.elements[0].value;

        $.ajax({
            type: 'DELETE', 
            url: "/place/" + id, 
            processData: false,
            contentType: false,
        })
          .then(function (data) {
              console.log({data});
              location.reload();
          })
          .catch(function (err) {
              console.log({err});
          });
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