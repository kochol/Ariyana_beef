using System;

namespace ari
{
	public static class NetSerializer
	{
		// uint32
		[CLink]
		static extern bool SerializeUint32(void* _stream, ref uint32 _val);
		[CLink]
		static extern bool SerializeMeasureUint32(void* _stream, ref uint32 _val);
		[CLink]
		static extern bool DeserializeUint32(void* _stream, ref uint32 _val);

		public static bool Serialize(void* _stream, ref uint32 _val)
		{
			return SerializeUint32(_stream, ref _val);
		}

		public static bool SerializeMeasure(void* _stream, ref uint32 _val)
		{
			return SerializeMeasureUint32(_stream, ref _val);
		}

		public static bool Deserialize(void* _stream, ref uint32 _val)
		{
			return DeserializeUint32(_stream, ref _val);
		}

	}
}
