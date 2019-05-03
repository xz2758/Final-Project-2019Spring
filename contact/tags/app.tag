<app>
  <h2 class="w3-center" >Leave your words to us. We need your help.</h2>
  <div class="memeMaker">

        <input type="text" ref="name" placeholder="Your Name" style="width:20%">
        <select id="gender" name="gender">
            <option value="au">Select Gender</option>
            <option value="au">Male</option>
            <option value="ca">Female</option>
        </select>
<br><br>
        <input class="comment" type="text" ref="comment" placeholder="Write Something...">
<br>
      <div class="submit">
        <button type="button" onclick={ saveMsg }>Submit</button>
      </div>
  </div>


<div each={entry in messages}>
  <div>test</div>
</div>

<script>
      var tag = this;

      var messagesRef = rootRef.child('messages');
      console.log("messagesRef", messagesRef);

      this.name = "anonymous"; // Starts anonymous, set by user interface.
      this.messages = [];


    //  this.setUser = function(){
    //    this.userID = this.refs.userInput.value;
    //    console.log("userID", this.userID);
    //  }

      this.saveMsg = function(){
        var key = messagesRef.push().key;
        // console.log(key);


        // Our data object that we will write to the database.
        // We could design this model to have other properties, like author.
        var msg = {
          key: key,
          uid: this.refs.name.value,
          message: this.refs.commnet.value,
        };


        messagesRef.child(key).set(msg);
      }
      // Listen for data changes (READ)
      // See 0-dataRead
      messagesRef.on('value', function(snap){
        let dataAsObj = snap.val();
        console.log(dataAsObj);
        var tempData = [];

        //instead of statically typing out the array value, we now read it in
        //from the firebase data obj using a js for loop structure
        for (key in dataAsObj) {
          tempData.push(dataAsObj[key]);
        }

        tag.messages = tempData;

        //same question, 4th time of encounter. Why do we need to call tag update here?
        tag.update();
      });
</script>








  <style>
      :scope {
        display: block;
        padding: 2em;
      }

      select {
        width: 20%;
        padding: 16px 20px;
        border: none;
        border-radius: 4px;
        background-color: #f1f1f1;
      }

      input[type=text]{
        border: 2px solid darkgrey;
      }

      .comment{
        height:200px;
        width: 45%;
      }

      .submit{
        margin-left: 500px;

      }

      .memeMaker {
        padding: 2em;
        margin-top: 2em;
        background-color: grey;
      }


    </style>
</app>
