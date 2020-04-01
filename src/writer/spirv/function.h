// Copyright 2020 The Tint Authors.
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

#ifndef SRC_WRITER_SPIRV_FUNCTION_H_
#define SRC_WRITER_SPIRV_FUNCTION_H_

#include <vector>

#include "spirv/unified1/spirv.hpp11"
#include "src/writer/spirv/instruction.h"
#include "src/writer/spirv/operand.h"

namespace tint {
namespace writer {
namespace spirv {

/// A SPIR-V function
class Function {
 public:
  /// Constructor for testing purposes
  /// This creates a bad declaration, so won't generate correct SPIR-V
  Function();

  /// Constructor
  /// @param declaration the function declaration
  /// @param label_op the operand for the initial function label
  /// @param params the function parameters
  Function(const Instruction& declaration,
           const Operand& label_op,
           const std::vector<Instruction>& params);
  /// Copy constructor
  /// @param other the function to copy
  Function(const Function& other) = default;
  ~Function();

  /// Iterates over the function call the cb on each instruction
  /// @param cb the callback to call
  void iterate(std::function<void(const Instruction&)> cb) const;

  /// @returns the declaration
  const Instruction& declaration() const { return declaration_; }

  /// Adds an instruction to the instruction list
  /// @param op the op to set
  /// @param operands the operands for the instruction
  void push_inst(spv::Op op, const std::vector<Operand>& operands) {
    instructions_.push_back(Instruction{op, operands});
  }
  /// @returns the instruction list
  const std::vector<Instruction>& instructions() const { return instructions_; }

  /// Adds a variable to the variable list
  /// @param operands the operands for the variable
  void push_var(const std::vector<Operand>& operands) {
    vars_.push_back(Instruction{spv::Op::OpVariable, operands});
  }
  /// @returns the variable list
  const std::vector<Instruction>& variables() const { return vars_; }

  /// @returns the word length of the function
  uint32_t word_length() const {
    // 1 for the Label and 1 for the FunctionEnd
    uint32_t size = 2 + declaration_.word_length();

    for (const auto& param : params_) {
      size += param.word_length();
    }
    for (const auto& var : vars_) {
      size += var.word_length();
    }
    for (const auto& inst : instructions_) {
      size += inst.word_length();
    }
    return size;
  }

 private:
  Instruction declaration_;
  Operand label_op_;
  std::vector<Instruction> params_;
  std::vector<Instruction> vars_;
  std::vector<Instruction> instructions_;
};

}  // namespace spirv
}  // namespace writer
}  // namespace tint

#endif  // SRC_WRITER_SPIRV_FUNCTION_H_
