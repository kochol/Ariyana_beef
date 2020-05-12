using ari;

namespace t01Init
{
	public class GameApp: Application
	{
		World _world = new World() ~ delete _;

		public override void OnFrame(float _elapsedTime)
		{
			base.OnFrame(_elapsedTime);
			_world.Update(_elapsedTime);
		}
	}
}
