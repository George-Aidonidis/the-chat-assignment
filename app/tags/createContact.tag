<create-contact>
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
            <h2 class="text-center">Welcome</h2>
            <form role="form" onsubmit={ handleSubmit }>
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="firstName">First Name</label>
                  <input name="firstName" class="form-control" placeholder="Enter your name" type="text" tabindex="1" required autofocus>
                </div>
                <div class="form-group col-md-6">
                  <label for="firstName">Email Name</label>
                  <input name="lastName" class="form-control" placeholder="Enter your surname" type="text" tabindex="2" required>
                </div>
              </div>
              <div class="form-group">
                <label for="firstName">Email</label>
                <input name="email" class="form-control" placeholder="Enter your email" type="email" tabindex="3" required>
              </div>
              <div class="row">
                <div class="form-group col-md-4">
                  <label for="firstName">Home Phone</label>
                  <input name="phone" class="form-control" placeholder="Enter your home phone number" type="tel" tabindex="4" required>
                </div>
                <div class="form-group col-md-4">
                  <label for="firstName">Work Phone</label>
                  <input name="work" class="form-control" placeholder="Enter your work phone number" type="tel" tabindex="5">
                </div>
                <div class="form-group col-md-4">
                  <label for="firstName">Mobile Phone</label>
                  <input name="mobile" class="form-control" placeholder="Enter your mobile phone number" type="tel" tabindex="6">
                </div>
              </div>
              <hr/>
              <div class="form-group text-center">
                <button class="btn btn-default" type="submit" tabindex="7">Create contact</button>
              </div>
              <div class="alert alert-danger alert-dismissible fade in" style="display: none">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Error</strong>
                <p>Contact was not created</p>
              </div>
              <div class="alert alert-success alert-dismissible fade in" style="display: none">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Created</strong>
                <p>Contact was created!</p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  <div>
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
          this.post(contact, e.target);

        }
        post(contact, form) {
          $.post('/create', contact)
            .done(function (data) {
              form.reset();
              $('.alert-success').slideDown(300).delay(2000).slideUp(300);
            })
            .fail(function (e) {
              $('.alert-danger').slideDown(300).delay(2000).slideUp(300)
            });
        }
    </script>
</create-contact>