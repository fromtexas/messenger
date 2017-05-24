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
//= require jquery-ui
//= require_tree .


(function() {
  $(document).on('click', '.toggle-window', function(e) {
    e.preventDefault();
    var panel = $(this).parent().parent();
    var messages_list = panel.find('.messages-list');
 
    panel.find('.panel-body').toggle();
   
 
    if (panel.find('.panel-body').is(':visible')) {
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });

//$(document).on('click','.small-w', function(e){
//e.preventDefault();
//var convId = $(this).parent().parent().attr('data-conversation-id');
//var name = $(this).parent().find('.toggle-window').text();
//console.log(name);
//$(this).parent().parent().parent().remove();
//$('.toggeled-panels').append('<li><div class="panel panel-primary" data-conversation-id="'+convId+'"><div class="panel-heading"><a>'+name+'</a></div></div></li>');
//})





})();

var search = function(){
$( "#sug" ).autocomplete({
      source: '/search'
    }).autocomplete( "instance" )._renderItem = function( ul, item ) {
    
      return $( "<li>" )
        .append( "<div><a rel='nofollow' data-remote='true' data-method='post' style='color:#fff; margin-right:5px;' class='btn btn-primary' href='/lists?user_id=" + item[0]+ " '>ADD </a>" + item[1] +  "</div>" )
        .appendTo( ul );
    };
};

$(document).ready(search);
