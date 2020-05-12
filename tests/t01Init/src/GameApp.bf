using ari;

namespace t01Init
{
	public class GameApp: Application
	{
		World _world = new World() ~ delete _;
		RenderSystem _renderSystem = new RenderSystem() ~ delete _;
		SceneSystem _sceneSystem = new SceneSystem() ~ delete _;

		public override void OnInit()
		{
			base.OnInit();
			_world.AddSystem(_renderSystem);
			_world.AddSystem(_sceneSystem);
		}

		public override void OnFrame(float _elapsedTime)
		{
			base.OnFrame(_elapsedTime);
			_world.Update(_elapsedTime);
		}
	}
}
