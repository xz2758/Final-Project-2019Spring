<message>
  <p>{ uid }</p>
  <p>{ message}></p>
  <button type="button" onclick={ remove }>Remove This</button>


  <script>
        var messagesRef = rootRef.child('/messages');
        remove = function (){
            console.log("this.id", this.id);
        var key = this.id;
        messagesRef.child(key).remove();
        }
  </script>


  <style media="screen">

  :scope {
    display: block;
    background-color: pink;
    margin-top: 2em;
    padding: 2em;
  }
  </style>





</message>
