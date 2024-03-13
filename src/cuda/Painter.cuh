#pragma once

#include <string>

#include "../Configs.h"

#include "Buffers.cuh"
#include "KernelCaller.cuh"

namespace graphics {

class Painter {
private:
    KernelCaller _caller;

    unsigned int _length;

    CpuColorMapBuffer _colorMap;

    CpuPixelBuffer2D _cpuPixels;
    GpuPixelBuffer2D _gpuPixels;

    CpuFloatBuffer _cpuFloat;
    GpuFloatBuffer _gpuFloat;

    void readColorMap(const std::string& colorMapName);
    float findAmplitude(const mhd::GpuDoubleBuffer2D& src);

public:
    Painter(const mhd::Configs& configs);

    void doubleToPixels(const mhd::GpuDoubleBuffer2D& src);

    void saveAsPNG(const std::filesystem::path& filePath);

    const CpuPixelBuffer2D& getPixels() const { return _cpuPixels; }
    unsigned int getLength() const { return _length; }
};
}  // namespace graphics
