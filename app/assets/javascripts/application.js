// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



var songs;
var currentsong = 0 ;
SC.initialize({client_id: '070d0060ad294d163aaeac718274a5c0'
});



// searching for songs thats given
var Majid_Jordan = SC.get("/tracks",{
 q:"frank ocean"
 // 
}).then(function(response){
  songs = response;
  console.log(songs)
  // response is getting the data from the function called on tracks 
  //this is where song  meets current
  SC.stream("/tracks/" + songs[currentsong].id ).then (function(player){
    console.log(player);
    // player.play();
  });
});

// loads and plays when clicked
//asking soundcloud to return what i put in 
// response is getting the data from the function called on tracks 
//songs is storing the data
//this is where song  meets current

$("#load").click(function () {
SC.get("/tracks",{
 q: $("#search").val()
}).then(function(response){
  songs = response;
  console.log(songs)
  SC.stream("/tracks/" + songs[currentsong].id ).then (function(player){
    console.log(player);
    player.play();
    });
  });
})

$("#shuf").click(function() {
   currentsong = Math.floor(Math.random()* songs.length );
    SC.stream("/tracks/" + songs[currentsong].id ).then (function(player){
      console.log(player);
      player.play();
  });
 });

$("#butnext").click(function(){
  currentsong = (currentsong + 1)% songs.length;
    SC.stream("/tracks/" + songs[currentsong].id ).then (function(player){
      console.log(player);
      player.play();
  });
});


$("#back").click(function(){
  currentsong = (currentsong - 1)% songs.length;
    SC.stream("/tracks/" + songs[currentsong].id ).then (function(player){
      console.log(player);
      player.play();
  });
});








