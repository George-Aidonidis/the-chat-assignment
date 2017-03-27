<contact>
  <section id="loginform" class="outer-wrapper">
    <div class="inner-wrapper">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <a href="/">
              <button type="button" class="btn btn-default btn-lg">
              <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
              Home
            </button>
            </a>
            <h2 class="text-center">Welcome back {opts.firstName}</h2>
            <form role="form" onsubmit={ handleSubmit }>
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="firstName">First Name</label>
                  <input name="firstName" value="{opts.firstName}" class="form-control" placeholder="Enter your name" type="text" tabindex="1"
                    required autofocus>
                </div>
                <div class="form-group col-md-6">
                  <label for="firstName">Email Name</label>
                  <input name="lastName" value="{opts.lastName}" class="form-control" placeholder="Enter your surname" type="text" tabindex="2"
                    required>
                </div>
              </div>
              <div class="form-group">
                <label for="firstName">Email</label>
                <input name="email" value="{opts.email}" class="form-control" placeholder="Enter your email" type="email" tabindex="3" required>
              </div>
              <div class="row">
                <div class="form-group col-md-4">
                  <label for="firstName">Home Phone</label>
                  <input name="phone" value="{opts.phone}" class="form-control" placeholder="Enter your home phone number" type="tel" tabindex="4"
                    required>
                </div>
                <div class="form-group col-md-4">
                  <label for="firstName">Work Phone</label>
                  <input name="work" value="{opts.work}" class="form-control" placeholder="Enter your work phone number" type="tel" tabindex="5">
                </div>
                <div class="form-group col-md-4">
                  <label for="firstName">Mobile Phone</label>
                  <input name="mobile" value="{opts.mobile}" class="form-control" placeholder="Enter your mobile phone number" type="tel" tabindex="6">
                </div>
              </div>
              <hr/>
              <div class="form-group text-center">
                <button class="btn btn-default" type="submit" tabindex="7">Update contact</button>
              </div>
              <div class="alert alert-danger alert-dismissible fade in" style="display: none">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Error</strong>
                <p>Contact was not updated</p>
              </div>
              <div class="alert alert-success alert-dismissible fade in" style="display: none">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Update</strong>
                <p>Contact was updated!</p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  <script>
    handleSubmit(e) {
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
          $('.alert-success').slideDown(300).delay(2000).slideUp(300);
        })
        .fail(function (e) {
          $('.alert-danger').slideDown(300).delay(2000).slideUp(300)
        });
    }
  </script>
</contact>