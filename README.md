Test code to test compiler behaviour for OpenMP target off-loading of
"typedef" variables.

Sample output when using nvidia's "nvprof" to ensure that the appropriate
operation was off-loaded to the GPU device.

<pre>
==92628== NVPROF is profiling process 92628, command: ./a.out
Size of typdef variable: 16 
Value of C[0] at 0 is 0.500000: correct value: 0.500000
Value of C[1] at 0 is 0.700000: correct value: 0.700000
Value of C[0] at 1 is 1.500000: correct value: 1.500000
Value of C[1] at 1 is 2.700000: correct value: 2.700000
Value of C[0] at 2 is 2.500000: correct value: 2.500000
Value of C[1] at 2 is 4.700000: correct value: 4.700000
Value of C[0] at 3 is 3.500000: correct value: 3.500000
Value of C[1] at 3 is 6.700000: correct value: 6.700000
Value of C[0] at 4 is 4.500000: correct value: 4.500000
Value of C[1] at 4 is 8.700000: correct value: 8.700000
Value of C[0] at 5 is 5.500000: correct value: 5.500000
Value of C[1] at 5 is 10.700000: correct value: 10.700000
Value of C[0] at 6 is 6.500000: correct value: 6.500000
Value of C[1] at 6 is 12.700000: correct value: 12.700000
Value of C[0] at 7 is 7.500000: correct value: 7.500000
Value of C[1] at 7 is 14.700000: correct value: 14.700000
Value of C[0] at 8 is 8.500000: correct value: 8.500000
Value of C[1] at 8 is 16.700000: correct value: 16.700000
Value of C[0] at 9 is 9.500000: correct value: 9.500000
Value of C[1] at 9 is 18.700000: correct value: 18.700000
Code completed execution! 
==92628== Profiling application: ./a.out
==92628== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:   41.25%  5.5040us         3  1.8340us  1.3440us  2.1120us  [CUDA memcpy HtoD]
                   31.89%  4.2560us         1  4.2560us  4.2560us  4.2560us  __xl_main_l55_OL_1
                   26.86%  3.5840us         2  1.7920us  1.7920us  1.7920us  [CUDA memcpy DtoH]
      API calls:   62.93%  219.51ms         1  219.51ms  219.51ms  219.51ms  cuCtxCreate
                   27.55%  96.088ms         1  96.088ms  96.088ms  96.088ms  cuModuleLoadDataEx
                    6.41%  22.349ms         1  22.349ms  22.349ms  22.349ms  cuMemAllocHost
                    1.53%  5.3278ms         1  5.3278ms  5.3278ms  5.3278ms  cuMemAlloc
                    0.46%  1.5969ms        97  16.463us     231ns  656.70us  cuDeviceGetAttribute
                    0.44%  1.5410ms         1  1.5410ms  1.5410ms  1.5410ms  cudaGetDeviceProperties
                    0.30%  1.0363ms         1  1.0363ms  1.0363ms  1.0363ms  cuDeviceTotalMem
                    0.29%  996.95us        32  31.154us  2.7910us  461.61us  cuStreamCreate
                    0.04%  135.86us         1  135.86us  135.86us  135.86us  cuDeviceGetName
                    0.01%  45.244us         1  45.244us  45.244us  45.244us  cuMemcpyDtoH
                    0.01%  43.115us         3  14.371us  7.4200us  24.547us  cuMemcpyHtoDAsync
                    0.01%  31.643us         1  31.643us  31.643us  31.643us  cuLaunchKernel
                    0.01%  27.045us         1  27.045us  27.045us  27.045us  cuModuleGetFunction
                    0.01%  26.205us         3  8.7350us  4.9430us  11.505us  cuEventSynchronize
                    0.00%  8.1480us         1  8.1480us  8.1480us  8.1480us  cuMemcpyDtoHAsync
                    0.00%  7.0230us         3  2.3410us     727ns  5.5420us  cuEventDestroy
                    0.00%  6.9400us         4  1.7350us     928ns  2.6280us  cuPointerGetAttributes
                    0.00%  4.5250us         3  1.5080us     988ns  2.4730us  cuEventRecord
                    0.00%  4.2030us         1  4.2030us  4.2030us  4.2030us  cuDeviceGetPCIBusId
                    0.00%  4.1220us         3  1.3740us     785ns  2.3300us  cuEventCreate
                    0.00%  3.0190us         2  1.5090us  1.1660us  1.8530us  cuModuleGetGlobal
                    0.00%  2.9760us         3     992ns     506ns  1.6850us  cuCtxSetCurrent
                    0.00%  2.5550us         4     638ns     469ns  1.0980us  cuDeviceGetCount
                    0.00%  1.5540us         1  1.5540us  1.5540us  1.5540us  cuInit
                    0.00%  1.5120us         3     504ns     352ns     724ns  cuDeviceGet
                    0.00%  1.4940us         1  1.4940us  1.4940us  1.4940us  cuFuncGetAttribute
                    0.00%     801ns         1     801ns     801ns     801ns  cuDriverGetVersion
                    0.00%     393ns         1     393ns     393ns     393ns  cuCtxGetCurrent
                    0.00%     330ns         1     330ns     330ns     330ns  cuDeviceGetUuid
</pre>

