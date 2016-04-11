
import js.Browser.window;
import om.api.youtube.YouTube;
import om.api.youtube.YouTubePlayer;

class App {

	static var player : YouTubePlayer;

	static function main() {

		YouTube.init( function(){

			player= new YouTubePlayer( 'videoplayer',
			{
				width: window.innerWidth+'px',
				height: window.innerHeight+'px',
				videoId: 'eJMQCty6HJM',
				playerVars: {
					autoplay: 1,
					controls: no,
					color: white,
					//enablejsapi: 1,
					fs: 0,
					iv_load_policy: 3,
					//loop: 1,
					modestbranding: 1,
					showinfo: 0
				},
				events: {
					onReady: function(){
						player.setPlaybackQuality( highres );
						player.playVideo();
					},
					//onStateChange: handlePlayerStateChange,
					//onPlaybackQualityChange: handlePlaybackQualityChange,
					//onPlaybackRateChange: handlePlaybackRateChange,
					//onError: handlePlayerError,
					//'onApiChange': handlePlayerAPIChange
				}
			});
		});
	}
}