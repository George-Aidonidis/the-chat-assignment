<index>
  <section id="loginform" class="outer-wrapper">
    <div class="inner-wrapper">
      <div class="container">
        <div class="col-md-offset-4 col-md-4">
          <div class="row text-center">
            <h3>The chat room Phone Book</h3>
            <ul class="list-group">
              <li each={ opts } class="list-group-item row">
                <a href="/contact/{_id}">{firstName} {lastName}</a>
                <button onclick={ delete } id="{_id}" type="button" class="btn btn-default btn-sm pull-right">
                    <span class="glyphicon glyphicon-trash"></span>
                  </button>
              </li>
            </ul>
            <a href="/create" class="btn btn-info" role="button">Create new contact</a>
            <h3 class="info" style="display: none;">Could not save</h3>
          </div>
          <div class="alert alert-danger alert-dismissible fade in" style="display: none">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Error</strong>
            <p>Contact was not deleted</p>
          </div>
          <div class="alert alert-success alert-dismissible fade in" style="display: none">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Delete</strong>
            <p>Contact was deleted!</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <script>
      delete (e) {
        // remove view element from page also 
        $.ajax({
          url: '/delete/' + e.target.id,
          type: 'DELETE'
        })
          .done(function (data) {
            $('#' + e.target.id).parent().remove();
            $('.alert-success').slideDown(300).delay(2000).slideUp(300);
          })
          .fail(function (e) {
            $('.alert-danger').slideDown(300).delay(2000).slideUp(300)
          });
      }
  </script>

</index>