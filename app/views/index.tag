<index>
  <h3>Contacts 12</h3>
  <div each={ opts }>
    <a href="/contact/{_id}">{firstName} {lastName}</a>
    <input onclick={ delete } id="{_id}" type="button" value="delete">
  </div>
  <a href="/create">Create new contact</a>
  <h3 class="info" style="display: none;">Could not save</h3>
  <script>
    delete(e) {
      // remove view element from page also 
      $.ajax({
        url: '/delete/' + e.target.id,
        type: 'DELETE'
      })
      .done(function (data) {
        $('#'+e.target.id).parent().remove();
        $('.info').text('Contact Removed').show();
      })
      .fail(function(e) {
        $('.info').text('Could not remove contact' + JSON.stringify(e)).show();
        console.error('Could not remove'+contact);
      });
    }
  </script>

</index>