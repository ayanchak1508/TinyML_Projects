??
??
D
AddV2
x"T
y"T
z"T"
Ttype:
2	??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
?
AudioMicrofrontend	
audio
filterbanks"out_type"
sample_rateint?}"
window_sizeint"
window_stepint
"
num_channelsint " 
upper_band_limitfloat% `?E" 
lower_band_limitfloat%  ?B"
smoothing_bitsint
"
even_smoothingfloat%???<"
odd_smoothingfloat%??u="$
min_signal_remainingfloat%??L="
enable_pcanbool( "
pcan_strengthfloat%33s?"
pcan_offsetfloat%  ?B"
	gain_bitsint"

enable_logbool("
scale_shiftint"
left_contextint "
right_contextint "
frame_strideint"
zero_paddingbool( "
	out_scaleint"
out_typetype0:
2
p
AudioSpectrogram	
input
spectrogram"
window_sizeint"
strideint"
magnitude_squaredbool( 
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

?
	DecodeWav
contents	
audio
sample_rate"$
desired_channelsint?????????"#
desired_samplesint?????????
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
?
Mul
x"T
y"T
z"T"
Ttype:
2	?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
@
ReadVariableOp
resource
value"dtype"
dtypetype?
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
?
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	?
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?
9
VarIsInitializedOp
resource
is_initialized
?"serve*2.6.02v2.6.0-0-g919f693420e?n
I
wav_dataPlaceholder*
_output_shapes
: *
dtype0*
shape: 
}
decoded_sample_data	DecodeWavwav_data*!
_output_shapes
:	?}: *
desired_channels*
desired_samples?}
?
AudioSpectrogramAudioSpectrogramdecoded_sample_data*#
_output_shapes
:1?*
magnitude_squared(*
stride?*
window_size?
J
Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 * ??F
P
MulMuldecoded_sample_dataMul/y*
T0*
_output_shapes
:	?}
Z
CastCastMul*

DstT0*

SrcT0*
Truncate( *
_output_shapes
:	?}
`
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
[
ReshapeReshapeCastReshape/shape*
T0*
Tshape0*
_output_shapes	
:?}
?
AudioMicrofrontendAudioMicrofrontendReshape*
_output_shapes

:1(*

enable_log(*
enable_pcan(*
even_smoothing%???<*
frame_stride*
	gain_bits*
left_context *
lower_band_limit%  ?B*
min_signal_remaining%??L=*
num_channels(*
odd_smoothing%??u=*
	out_scale*
out_type0*
pcan_offset%  ?B*
pcan_strength%33s?*
right_context *
sample_rate?}*
scale_shift*
smoothing_bits
*
upper_band_limit% `?E*
window_size*
window_step*
zero_padding( 
L
Mul_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   =
R
Mul_1MulAudioMicrofrontendMul_1/y*
T0*
_output_shapes

:1(
`
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"?????  
d
	Reshape_1ReshapeMul_1Reshape_1/shape*
T0*
Tshape0*
_output_shapes
:	?
h
Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"????1   (      
o
	Reshape_2Reshape	Reshape_1Reshape_2/shape*
T0*
Tshape0*&
_output_shapes
:1(
?
0first_weights/Initializer/truncated_normal/shapeConst* 
_class
loc:@first_weights*
_output_shapes
:*
dtype0*%
valueB"
            
?
/first_weights/Initializer/truncated_normal/meanConst* 
_class
loc:@first_weights*
_output_shapes
: *
dtype0*
valueB
 *    
?
1first_weights/Initializer/truncated_normal/stddevConst* 
_class
loc:@first_weights*
_output_shapes
: *
dtype0*
valueB
 *
?#<
?
:first_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormal0first_weights/Initializer/truncated_normal/shape*
T0* 
_class
loc:@first_weights*&
_output_shapes
:
*
dtype0*

seed *
seed2 
?
.first_weights/Initializer/truncated_normal/mulMul:first_weights/Initializer/truncated_normal/TruncatedNormal1first_weights/Initializer/truncated_normal/stddev*
T0* 
_class
loc:@first_weights*&
_output_shapes
:

?
*first_weights/Initializer/truncated_normalAddV2.first_weights/Initializer/truncated_normal/mul/first_weights/Initializer/truncated_normal/mean*
T0* 
_class
loc:@first_weights*&
_output_shapes
:

?
first_weightsVarHandleOp* 
_class
loc:@first_weights*
_output_shapes
: *
allowed_devices
 *
	container *
dtype0*
shape:
*
shared_namefirst_weights
k
.first_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOpfirst_weights*
_output_shapes
: 
p
first_weights/AssignAssignVariableOpfirst_weights*first_weights/Initializer/truncated_normal*
dtype0
w
!first_weights/Read/ReadVariableOpReadVariableOpfirst_weights*&
_output_shapes
:
*
dtype0
?
first_bias/Initializer/zerosConst*
_class
loc:@first_bias*
_output_shapes
:*
dtype0*
valueB*    
?

first_biasVarHandleOp*
_class
loc:@first_bias*
_output_shapes
: *
allowed_devices
 *
	container *
dtype0*
shape:*
shared_name
first_bias
e
+first_bias/IsInitialized/VarIsInitializedOpVarIsInitializedOp
first_bias*
_output_shapes
: 
\
first_bias/AssignAssignVariableOp
first_biasfirst_bias/Initializer/zeros*
dtype0
e
first_bias/Read/ReadVariableOpReadVariableOp
first_bias*
_output_shapes
:*
dtype0
k
Conv2D/ReadVariableOpReadVariableOpfirst_weights*&
_output_shapes
:
*
dtype0
?
Conv2DConv2D	Reshape_2Conv2D/ReadVariableOp*
T0*&
_output_shapes
:*
data_formatNHWC*
	dilations
*
explicit_paddings
 *
paddingSAME*
strides
*
use_cudnn_on_gpu(
Y
add/ReadVariableOpReadVariableOp
first_bias*
_output_shapes
:*
dtype0
Y
addAddV2Conv2Dadd/ReadVariableOp*
T0*&
_output_shapes
:
B
ReluReluadd*
T0*&
_output_shapes
:
`
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB"?????  
c
	Reshape_3ReshapeReluReshape_3/shape*
T0*
Tshape0*
_output_shapes
:	?
?
3final_fc_weights/Initializer/truncated_normal/shapeConst*#
_class
loc:@final_fc_weights*
_output_shapes
:*
dtype0*
valueB"?     
?
2final_fc_weights/Initializer/truncated_normal/meanConst*#
_class
loc:@final_fc_weights*
_output_shapes
: *
dtype0*
valueB
 *    
?
4final_fc_weights/Initializer/truncated_normal/stddevConst*#
_class
loc:@final_fc_weights*
_output_shapes
: *
dtype0*
valueB
 *
?#<
?
=final_fc_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormal3final_fc_weights/Initializer/truncated_normal/shape*
T0*#
_class
loc:@final_fc_weights*
_output_shapes
:	?*
dtype0*

seed *
seed2 
?
1final_fc_weights/Initializer/truncated_normal/mulMul=final_fc_weights/Initializer/truncated_normal/TruncatedNormal4final_fc_weights/Initializer/truncated_normal/stddev*
T0*#
_class
loc:@final_fc_weights*
_output_shapes
:	?
?
-final_fc_weights/Initializer/truncated_normalAddV21final_fc_weights/Initializer/truncated_normal/mul2final_fc_weights/Initializer/truncated_normal/mean*
T0*#
_class
loc:@final_fc_weights*
_output_shapes
:	?
?
final_fc_weightsVarHandleOp*#
_class
loc:@final_fc_weights*
_output_shapes
: *
allowed_devices
 *
	container *
dtype0*
shape:	?*!
shared_namefinal_fc_weights
q
1final_fc_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOpfinal_fc_weights*
_output_shapes
: 
y
final_fc_weights/AssignAssignVariableOpfinal_fc_weights-final_fc_weights/Initializer/truncated_normal*
dtype0
v
$final_fc_weights/Read/ReadVariableOpReadVariableOpfinal_fc_weights*
_output_shapes
:	?*
dtype0
?
final_fc_bias/Initializer/zerosConst* 
_class
loc:@final_fc_bias*
_output_shapes
:*
dtype0*
valueB*    
?
final_fc_biasVarHandleOp* 
_class
loc:@final_fc_bias*
_output_shapes
: *
allowed_devices
 *
	container *
dtype0*
shape:*
shared_namefinal_fc_bias
k
.final_fc_bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpfinal_fc_bias*
_output_shapes
: 
e
final_fc_bias/AssignAssignVariableOpfinal_fc_biasfinal_fc_bias/Initializer/zeros*
dtype0
k
!final_fc_bias/Read/ReadVariableOpReadVariableOpfinal_fc_bias*
_output_shapes
:*
dtype0
g
MatMul/ReadVariableOpReadVariableOpfinal_fc_weights*
_output_shapes
:	?*
dtype0
?
MatMulMatMul	Reshape_3MatMul/ReadVariableOp*
T0*
_output_shapes

:*
transpose_a( *
transpose_b( 
^
add_1/ReadVariableOpReadVariableOpfinal_fc_bias*
_output_shapes
:*
dtype0
U
add_1AddV2MatMuladd_1/ReadVariableOp*
T0*
_output_shapes

:
I
labels_softmaxSoftmaxadd_1*
T0*
_output_shapes

:
Y
save/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
n
save/filenamePlaceholderWithDefaultsave/filename/input*
_output_shapes
: *
dtype0*
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
_output_shapes
: *
dtype0*
shape: 
?
save/SaveV2/tensor_namesConst*
_output_shapes
:*
dtype0*O
valueFBDBfinal_fc_biasBfinal_fc_weightsB
first_biasBfirst_weights
k
save/SaveV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*
valueBB B B B 
?
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slices!final_fc_bias/Read/ReadVariableOp$final_fc_weights/Read/ReadVariableOpfirst_bias/Read/ReadVariableOp!first_weights/Read/ReadVariableOp*
dtypes
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const*
_output_shapes
: 
?
save/RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*O
valueFBDBfinal_fc_biasBfinal_fc_weightsB
first_biasBfirst_weights
}
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B B B 
?
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*$
_output_shapes
::::*
dtypes
2
L
save/IdentityIdentitysave/RestoreV2*
T0*
_output_shapes
:
T
save/AssignVariableOpAssignVariableOpfinal_fc_biassave/Identity*
dtype0
P
save/Identity_1Identitysave/RestoreV2:1*
T0*
_output_shapes
:
[
save/AssignVariableOp_1AssignVariableOpfinal_fc_weightssave/Identity_1*
dtype0
P
save/Identity_2Identitysave/RestoreV2:2*
T0*
_output_shapes
:
U
save/AssignVariableOp_2AssignVariableOp
first_biassave/Identity_2*
dtype0
P
save/Identity_3Identitysave/RestoreV2:3*
T0*
_output_shapes
:
X
save/AssignVariableOp_3AssignVariableOpfirst_weightssave/Identity_3*
dtype0
~
save/restore_allNoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_2^save/AssignVariableOp_3
[
save_1/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
r
save_1/filenamePlaceholderWithDefaultsave_1/filename/input*
_output_shapes
: *
dtype0*
shape: 
i
save_1/ConstPlaceholderWithDefaultsave_1/filename*
_output_shapes
: *
dtype0*
shape: 

save_1/StaticRegexFullMatchStaticRegexFullMatchsave_1/Const"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*
c
save_1/Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part
h
save_1/Const_2Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
?
save_1/SelectSelectsave_1/StaticRegexFullMatchsave_1/Const_1save_1/Const_2"/device:CPU:**
T0*
_output_shapes
: 
}
save_1/StringJoin
StringJoinsave_1/Constsave_1/Select"/device:CPU:**
N*
_output_shapes
: *
	separator 
S
save_1/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
?
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
?
save_1/SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*O
valueFBDBfinal_fc_biasBfinal_fc_weightsB
first_biasBfirst_weights
|
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B B B 
?
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slices!final_fc_bias/Read/ReadVariableOp$final_fc_weights/Read/ReadVariableOpfirst_bias/Read/ReadVariableOp!first_weights/Read/ReadVariableOp"/device:CPU:0*
dtypes
2
?
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
T0*)
_class
loc:@save_1/ShardedFilename*
_output_shapes
: 
?
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
N*
T0*
_output_shapes
:*

axis 
?
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(
?
save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
?
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*O
valueFBDBfinal_fc_biasBfinal_fc_weightsB
first_biasBfirst_weights

!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B B B 
?
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*$
_output_shapes
::::*
dtypes
2
R
save_1/Identity_1Identitysave_1/RestoreV2*
T0*
_output_shapes
:
Z
save_1/AssignVariableOpAssignVariableOpfinal_fc_biassave_1/Identity_1*
dtype0
T
save_1/Identity_2Identitysave_1/RestoreV2:1*
T0*
_output_shapes
:
_
save_1/AssignVariableOp_1AssignVariableOpfinal_fc_weightssave_1/Identity_2*
dtype0
T
save_1/Identity_3Identitysave_1/RestoreV2:2*
T0*
_output_shapes
:
Y
save_1/AssignVariableOp_2AssignVariableOp
first_biassave_1/Identity_3*
dtype0
T
save_1/Identity_4Identitysave_1/RestoreV2:3*
T0*
_output_shapes
:
\
save_1/AssignVariableOp_3AssignVariableOpfirst_weightssave_1/Identity_4*
dtype0
?
save_1/restore_shardNoOp^save_1/AssignVariableOp^save_1/AssignVariableOp_1^save_1/AssignVariableOp_2^save_1/AssignVariableOp_3
1
save_1/restore_allNoOp^save_1/restore_shard"?B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"?
trainable_variables??
~
first_weights:0first_weights/Assign#first_weights/Read/ReadVariableOp:0(2,first_weights/Initializer/truncated_normal:08
g
first_bias:0first_bias/Assign first_bias/Read/ReadVariableOp:0(2first_bias/Initializer/zeros:08
?
final_fc_weights:0final_fc_weights/Assign&final_fc_weights/Read/ReadVariableOp:0(2/final_fc_weights/Initializer/truncated_normal:08
s
final_fc_bias:0final_fc_bias/Assign#final_fc_bias/Read/ReadVariableOp:0(2!final_fc_bias/Initializer/zeros:08"?
	variables??
~
first_weights:0first_weights/Assign#first_weights/Read/ReadVariableOp:0(2,first_weights/Initializer/truncated_normal:08
g
first_bias:0first_bias/Assign first_bias/Read/ReadVariableOp:0(2first_bias/Initializer/zeros:08
?
final_fc_weights:0final_fc_weights/Assign&final_fc_weights/Read/ReadVariableOp:0(2/final_fc_weights/Initializer/truncated_normal:08
s
final_fc_bias:0final_fc_bias/Assign#final_fc_bias/Read/ReadVariableOp:0(2!final_fc_bias/Initializer/zeros:08*~
serving_defaultk
#
input
Reshape_1:0	?(
output
labels_softmax:0tensorflow/serving/predict