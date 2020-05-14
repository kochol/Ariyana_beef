using System;

namespace ari
{

	function void OnEventCB(ari_event* _event, ref WindowHandle _handle);

	static
	{
		[CLink]
		static extern uint64* GetFrameNumberPointer();


		[CLink]
		static extern void SetOnEventCallBack(OnEventCB _event_cb);

		static uint64* FrameNumber;

		static Application g_app;

		public static void OnEvent(ari_event* _event, ref WindowHandle _handle)
		{
			g_app.OnEvent(_event, ref _handle);
		}

		public static void RunApplication(Application _app)
		{
			FrameNumber = GetFrameNumberPointer();
			g_app = _app;

			// get the app setup configs
			Gfx.SetupGfx(_app.GetGfxSetup());

			// init the app
			_app.OnInit();

			// get time
			var last_time = DateTime.Now;

			// bind on event
			SetOnEventCallBack(=> OnEvent);

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

		public virtual void OnEvent(ari_event* _event, ref WindowHandle _handle)
		{

		}
	}
}
