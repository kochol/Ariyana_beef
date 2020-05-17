using System;

namespace ari
{

	function void OnEventCB(ari_event* _event, ref WindowHandle _handle);

	static
	{
		[Export, CLink, AlwaysInclude]
		static GfxSetup* GetGfxSetup()
		{
			return g_app.GetGfxSetup();
		}

		[Export, CLink, AlwaysInclude]
		static void OnInit()
		{
			g_app.OnInit();
			LastTime = DateTime.UtcNow;
		}

		[Export, CLink, AlwaysInclude]
		static void OnFrame()
		{
			*FrameNumber += 1;

			// update Io threads
			Io.UpdateIo();

			// calculate the elapsed time
			float elapsed = (float)DateTime.UtcNow.Subtract(LastTime).TotalSeconds;
			LastTime = DateTime.UtcNow;

			// Update the app
			g_app.OnFrame(elapsed);

		}


		[Export, CLink, AlwaysInclude]
		static void OnCleanUp()
		{
			g_app.OnCleanup();
		}

		[Export, CLink, AlwaysInclude]
		static void OnEvent(ari_event* _event)
		{
			WindowHandle h;
			h.Handle = h.Index = 0;
			g_app.OnEvent(_event, ref h);
		}

		[Export, CLink, AlwaysInclude]
		static void OnFail()
		{
			
		}

		[CLink]
		static extern uint64* GetFrameNumberPointer();

		[CLink]
		static extern void SetOnEventCallBack(OnEventCB _event_cb);

		static uint64* FrameNumber;

		static Application g_app = null;

		public static void OnEvent(ari_event* _event, ref WindowHandle _handle)
		{
			g_app.OnEvent(_event, ref _handle);
		}

		public static DateTime LastTime;

		public static void RunApplication(Application _app)
		{
			FrameNumber = GetFrameNumberPointer();
			g_app = _app;

			// get the app setup configs
			Gfx.SetupGfx(_app.GetGfxSetup());

#if BF_PLATFORM_ANDROID
			while(Io.Run())
			{
				System.Threading.Thread.Sleep(1000);
			}
#else // !BF_PLATFORM_ANDROID
			// init the app
			_app.OnInit();

			// get time
			LastTime = DateTime.Now;

			// bind on event
			SetOnEventCallBack(=> OnEvent);

			// run the loop
			while (Io.Run())
			{
				*FrameNumber += 1;

				// update Io threads
				Io.UpdateIo();

				// calculate the elapsed time
				float elapsed = (float)DateTime.Now.Subtract(LastTime).TotalSeconds;
				LastTime = DateTime.Now;

				// Update the app
				_app.OnFrame(elapsed);
			}

			// clean up the app
			_app.OnCleanup();
#endif // !BF_PLATFORM_ANDROID
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
