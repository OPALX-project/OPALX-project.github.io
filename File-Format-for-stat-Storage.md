Parts of the stat files of all runs should be stored into a single file such that the important data from all runs can be evaluated in post processing. The data should be supplemented with the values of the design variables. The file format for this storage should be based on hdf5 since it works well in massive parallel environment and it's already used in OPAL.

Each sample (simulation run on x cores initiated by the `SAMPLE` or `OPTIMIZE` command) stores key value pairs where the values are either scalar values (design variables, evaluated objectives) or array values (time series such as path length, rms x). The stored types can be integer, floating point or string values. Effectively double will be used more or less exclusively. In json the data written by one sample would look like this:
```
{
  "name_1": double value,
  "name_2": double value,
  "name_I": double value,
  "name_{I+1}": [double array of length N],
  "name_{I+2}": [double array of length N],
  "name_{I+J}": [double array of length N]
}
```
where `name_i` (1 <= i <= I) are the names of the design variables / objectives / columns from the stat file, `I` is the sum of the number of design variables and objectives (exact number can't be specified since both the design variable and the objectives are the users choice) and `J` is the number of column from the stat file that should be stored (not all columns should be stored, the specific columns are chosen by the users). 

Each sample will write the data independently of all other samples and the moment when it's written isn't coordinated between the samples. Also the length of the arrays can vary from sample to sample.

Possibly we should also store some data in a header, e.g. the name of an objective and its expression (as string), the ranges of the design variables, the values from the data file that were needed, the type of distribution of design variables (uniform / gaussian), whether raster is true or false. In json the whole file would look like this:
```
{
  "hname_1": double value,
  "hname_2": string value,
  "hname_K": integer value,
  { sample_1 },
  { sample_2 },
  { sample_X }
}
```
where `hname_k` (1 <= k <= K, k,K \in unsigned integer) are the names of the design variables / the variables from the data file / objectives and `{ sample_x }` is specified above.