<contact>
  <a href="/">Back</a>
  <h2>Contact Details</h2>
  <div>
    <h3>{opts.firstName}</h3>
    <h3>{opts.lastName}</h3>
    <h3>{opts.email}</h3>
    <h3>{opts.phone}</h3>
    <h3>{opts.work}</h3>
    <h3>{opts.mobile}</h3>
  </div>
  <form onsubmit={ handleSubmit }>
    <input name="firstName" value="{opts.firstName}" placeholder="First Name" type="text" tabindex="1" required autofocus>
    <input name="lastName" value="{opts.lastName}" placeholder="Last Name" type="text" tabindex="2" required>
    <input name="email" value="{opts.email}" placeholder="Email" type="email" tabindex="3" required>
    <input name="phone" value="{opts.phone}" placeholder="Home phone" type="tel" tabindex="4" required>
    <input name="work" value="{opts.work}" placeholder="Work phone" type="tel" tabindex="5">
    <input name="mobile" value="{opts.mobile}" placeholder="Mobile phone" type="tel" tabindex="6">
    <input type="submit" value="Save" title="Save contact!" tabindex="7"/>
  </form>
  <h3 class="info" style="display: none;">Could not save</h3>
  <script>
    handleSubmit(e) {
      console.log('submitting form');
      var contact = {
        firstName: this.firstName.value,
        lastName: this.lastName.value,
        email: this.email.value,
        phone: this.phone.value,
        work: this.work.value,
        mobile: this.mobile.value
      };
      this.post(contact, e);
    }
    post(contact) {
      $.ajax({
        type: 'PUT',
        data: contact
      })
      .done(function (data) {
        $('.info').text('Contact saved').show();
      })
      .fail(function(e) {
        $('.info').text('Could not save contact' + JSON.stringify(e)).show();
        console.error('Could not save'+contact);
      });
    }
  </script>
</contact>