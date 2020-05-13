using System;

namespace ari
{
	static
	{
		public static void RunApplication(Application _app)
		{
			// get the app setup configs
			var setup = _app.GetGfxSetup();
			Gfx.SetupGfx(setup);

			// init the app
			_app.OnInit();

			// get time
			var last_time = DateTime.Now;

			// run the loop
			while (Io.Run())
			{
				// update Io threads
				Io.UpdateIo();

				// calculate the elapsed time
				float elapsed = (float)DateTime.Now.Subtract(last_time).TotalSeconds;
				last_time = DateTime.Now;

				// Update the app
				_app.OnFrame(elapsed);
			}

			// clean up the app
			_app.OnCleanup();
			delete setup;
		}
	}

	public class Application
	{
		public virtual GfxSetup* GetGfxSetup()
		{
			return new GfxSetup();
		}

		public virtual void OnInit()
		{

		}

		public virtual void OnFrame(float _elapsedTime)
		{

		}

		public virtual void OnCleanup()
		{

		}

		public virtual void OnEvent()
		{

		}
	}
}
