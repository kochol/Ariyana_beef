using System;

namespace ari
{
	static
	{
		[CLink]
		static extern uint32* GetFrameNumberPointer();

		static uint32* FrameNumber;

		public static void RunApplication(Application _app)
		{
			FrameNumber = GetFrameNumberPointer();

			// get the app setup configs
			Gfx.SetupGfx(_app.GetGfxSetup());

			// init the app
			_app.OnInit();

			// get time
			var last_time = DateTime.Now;

			// run the loop
			while (Io.Run())
			{
				*FrameNumber += 1;

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
		}
	}

	public class Application
	{
		protected GfxSetup* setup = null;

		public virtual GfxSetup* GetGfxSetup()
		{
			if (setup == null)
				setup = new GfxSetup();
			return setup;
		}

		public virtual void OnInit()
		{

		}

		public virtual void OnFrame(float _elapsedTime)
		{

		}

		public virtual void OnCleanup()
		{
			delete setup;
		}

		public virtual void OnEvent()
		{

		}
	}
}
