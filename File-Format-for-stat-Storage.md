Parts of the stat files of all runs should be stored into a single file such that the important data from all runs can be evaluated in post processing. The data should be supplemented with the values of the design variables. The file format for this storage should be based on hdf5 since it works well in massive parallel environment and it's already used in OPAL.

Each sample (simulation run on x cores initiated by the `SAMPLE` or `OPTIMIZE` command) stores key value pairs where the values are either scalar values (design variables, evaluated objectives) or array values (time series such as path length, rms x). The stored types can be integer, floating point or string values. Effectively double will be used more or less exclusively. In json the data written by one sample would look like this:
```
{
  "name_1": double value,
  "name_2": double value,
  "name_i": double value,
  "name_{i+1}": [double array of length N],
  "name_{i+2}": [double array of length N],
  "name_{i+j}": [double array of length N]
}
```
Each sample will write the data independently of all other samples and the moment when it's written isn't coordinated between the samples. Also the length of the arrays can vary from sample to sample.

Possibly we should also store some data in a header, e.g. the name of an objective and its expression (as string), the ranges of the design variables, the type of distribution of design variables (uniform / gaussian), whether raster is true or false. In json the whole file would look like this:
```
{
  "name_I": double value,
  "name_II": string value,
  "name_III": integer value,
  { sample_1 },
  { sample_2 },
  { sample_X }
}
```
where `{ sample_x }` is specified above.