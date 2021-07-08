SamplerState samp : register(s0, space0);
cbuffer cbuffer_params : register(b1, space0) {
  uint4 params[1];
};
Texture2D<float4> inputTex : register(t1, space1);
RWTexture2D<float4> outputTex : register(u2, space1);

cbuffer cbuffer_flip : register(b3, space1) {
  uint4 flip[1];
};
groupshared float3 tile[4][256];

struct tint_symbol_1 {
  uint3 LocalInvocationID : SV_GroupThreadID;
  uint local_invocation_index : SV_GroupIndex;
  uint3 WorkGroupID : SV_GroupID;
};

[numthreads(64, 1, 1)]
void main(tint_symbol_1 tint_symbol) {
  const uint3 WorkGroupID = tint_symbol.WorkGroupID;
  const uint3 LocalInvocationID = tint_symbol.LocalInvocationID;
  const uint local_invocation_index = tint_symbol.local_invocation_index;
  if ((local_invocation_index == 0u)) {
    {
      for(int i_1 = 0; (i_1 < 4); i_1 = (i_1 + 1)) {
        {
          for(int i_2 = 0; (i_2 < 256); i_2 = (i_2 + 1)) {
            tile[i_1][i_2] = float3(0.0f, 0.0f, 0.0f);
          }
        }
      }
    }
  }
  GroupMemoryBarrierWithGroupSync();
  const uint scalar_offset = (0u) / 4;
  const uint filterOffset = ((params[scalar_offset / 4][scalar_offset % 4] - 1u) / 2u);
  int3 tint_tmp;
  inputTex.GetDimensions(0, tint_tmp.x, tint_tmp.y, tint_tmp.z);
  const int2 dims = tint_tmp.xy;
  const uint scalar_offset_1 = (4u) / 4;
  const int2 baseIndex = (int2(((WorkGroupID.xy * uint2(params[scalar_offset_1 / 4][scalar_offset_1 % 4], 4u)) + (LocalInvocationID.xy * uint2(4u, 1u)))) - int2(int(filterOffset), 0));
  {
    for(uint r = 0u; (r < 4u); r = (r + 1u)) {
      {
        for(uint c = 0u; (c < 4u); c = (c + 1u)) {
          int2 loadIndex = (baseIndex + int2(int(c), int(r)));
          const uint scalar_offset_2 = (0u) / 4;
          if ((flip[scalar_offset_2 / 4][scalar_offset_2 % 4] != 0u)) {
            loadIndex = loadIndex.yx;
          }
          tile[r][((4u * LocalInvocationID.x) + c)] = inputTex.SampleLevel(samp, ((float2(loadIndex) + float2(0.25f, 0.25f)) / float2(dims)), 0.0f).rgb;
        }
      }
    }
  }
  GroupMemoryBarrierWithGroupSync();
  {
    for(uint r = 0u; (r < 4u); r = (r + 1u)) {
      {
        for(uint c = 0u; (c < 4u); c = (c + 1u)) {
          int2 writeIndex = (baseIndex + int2(int(c), int(r)));
          const uint scalar_offset_3 = (0u) / 4;
          if ((flip[scalar_offset_3 / 4][scalar_offset_3 % 4] != 0u)) {
            writeIndex = writeIndex.yx;
          }
          const uint center = ((4u * LocalInvocationID.x) + c);
          bool tint_tmp_2 = (center >= filterOffset);
          if (tint_tmp_2) {
            tint_tmp_2 = (center < (256u - filterOffset));
          }
          bool tint_tmp_1 = (tint_tmp_2);
          if (tint_tmp_1) {
            tint_tmp_1 = all((writeIndex < dims));
          }
          if ((tint_tmp_1)) {
            float3 acc = float3(0.0f, 0.0f, 0.0f);
            {
              uint f = 0u;
              while (true) {
                const uint scalar_offset_4 = (0u) / 4;
                if (!((f < params[scalar_offset_4 / 4][scalar_offset_4 % 4]))) { break; }
                uint i = ((center + f) - filterOffset);
                const uint scalar_offset_5 = (0u) / 4;
                acc = (acc + ((1.0f / float(params[scalar_offset_5 / 4][scalar_offset_5 % 4])) * tile[r][i]));
                f = (f + 1u);
              }
            }
            outputTex[writeIndex] = float4(acc, 1.0f);
          }
        }
      }
    }
  }
  return;
}
