using ari;

namespace t02Network
{
	public class ClientApp : Application
	{
		World m_world = new World();
		RenderSystem m_renderSystem = new RenderSystem();
		SceneSystem m_sceneSystem = new SceneSystem();
		ClientSystem m_clientSystem = new ClientSystem();

		public override void OnInit()
		{
			base.OnInit();

			// Init network
			Net.InitNetwork();

			// Add systems
			m_world.AddSystem(m_renderSystem);
			m_world.AddSystem(m_sceneSystem);
			m_world.AddSystem(m_clientSystem);

			m_clientSystem.Connect("127.0.0.1", 55223);
		}

		public override void OnFrame(float _elapsedTime)
		{
			base.OnFrame(_elapsedTime);
			m_world.Update(_elapsedTime);
		}

		public override void OnEvent(ari_event* _event, ref WindowHandle _handle)
		{
			base.OnEvent(_event, ref _handle);
		}

		public override void OnCleanup()
		{
			base.OnCleanup();
			delete m_world;
			delete m_renderSystem;
			delete m_sceneSystem;
			m_clientSystem.StopClient();
			Net.ShutdownNetwork();
			delete m_clientSystem;
		}
	}
}
