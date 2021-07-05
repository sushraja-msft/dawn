// Copyright 2021 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef SRC_TRANSFORM_ZERO_INIT_WORKGROUP_MEMORY_H_
#define SRC_TRANSFORM_ZERO_INIT_WORKGROUP_MEMORY_H_

#include "src/transform/transform.h"

namespace tint {
namespace transform {

/// ZeroInitWorkgroupMemory is a transform that injects code at the top of entry
/// points to zero-initialize workgroup memory used by that entry point (and all
/// transitive functions called by that entry point)
class ZeroInitWorkgroupMemory
    : public Castable<ZeroInitWorkgroupMemory, Transform> {
 public:
  /// Configuration options for the transform
  struct Config : public Castable<Config, Data> {
    /// Constructor
    Config();

    /// Copy constructor
    Config(const Config&);

    /// Destructor
    ~Config() override;

    /// Assignment operator
    /// @returns this Config
    Config& operator=(const Config&);

    /// If greater than 0, then arrays of at least this size in bytes will be
    /// zero initialized using a for loop. If 0, then the array is assigned a
    /// zero initialized array with a single statement.
    uint32_t init_arrays_with_loop_size_threshold = 0;
  };

  /// Constructor
  ZeroInitWorkgroupMemory();

  /// Destructor
  ~ZeroInitWorkgroupMemory() override;

 protected:
  /// Runs the transform using the CloneContext built for transforming a
  /// program. Run() is responsible for calling Clone() on the CloneContext.
  /// @param ctx the CloneContext primed with the input program and
  /// ProgramBuilder
  /// @param inputs optional extra transform-specific input data
  /// @param outputs optional extra transform-specific output data
  void Run(CloneContext& ctx, const DataMap& inputs, DataMap& outputs) override;

 private:
  struct State;
};

}  // namespace transform
}  // namespace tint

#endif  // SRC_TRANSFORM_ZERO_INIT_WORKGROUP_MEMORY_H_
