using System;

namespace ari
{
	[CRepr]
	public struct Vector3
	{
		public float x;
		public float y;
		public float z;
	}

	[CRepr]
	public struct Quat
	{
		public float x;
		public float y;
		public float z;
		public float w;
	}
}
