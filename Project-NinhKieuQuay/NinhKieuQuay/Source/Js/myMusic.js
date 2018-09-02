	  var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '300',
          width: '380',
          videoId: 'Ldrl3LMmYeU',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      function onPlayerReady(event) {
        event.target.playVideo();
      }

      var done = false;
      function onPlayerStateChange(event) {
      }
	  
      function stopVideo() {
        player.stopVideo();
      }
	  
	  function onPlayerReady(event) {
	    event.target.setVolume(50);
	    event.target.playVideo();
	  }