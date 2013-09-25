/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.assimp3.functions;

private import derelict.assimp3.types;

aiReturn aiGetMaterialFloat( const( aiMaterial)* mat, const( char )* key, uint type, uint index, float* _out ) {
    return aiGetMaterialFloatArray( mat, key, type, index, _out, null );
}

aiReturn aiGetMaterialInteger( const( aiMaterial )* mat, const( char )* key, uint type, uint index, int* _out) {
    return aiGetMaterialIntegerArray( mat, key, type, index, _out, null );
}

extern( C ) nothrow {
    // cexport.h
    alias size_t function() da_aiGetExportFormatCount;
    alias aiExportFormatDesc* function( size_t ) da_aiGetExportFormatDescription;
    alias void function( const( aiScene )*, aiScene** ) da_aiCopyScene;
    alias aiReturn function( const( aiScene )*, const( char )*, const( char )*, uint  ) da_aiExportScene;
    alias aiReturn function( const( aiScene )*, const( char )*, const( char )*, aiFileIO*, uint ) da_aiExportSceneEx;
    alias const( aiExportDataBlob )* function( const( aiScene )*, const( char )*, uint ) da_aiExportSceneToBlob;
    alias void function( const( aiExportDataBlob )* ) da_aiReleaseExportBlob;

    // cimport.h
    alias const( aiScene* ) function( const( char )*, uint ) da_aiImportFile;
    alias const( aiScene* ) function( const( char )*, uint, aiFileIO* ) da_aiImportFileEx;
    alias const( aiScene* ) function( const( char )*, uint, aiFileIO*, const( aiPropertyStore )* ) da_aiImportFileExWithProperties;
    alias const( aiScene* ) function( const( void )*, uint, uint, const( char )* ) da_aiImportFileFromMemory;
    alias const( aiScene* ) function( const( void )*, uint, uint, const( char )*, const( aiPropertyStore )* ) da_aiImportFileFromMemoryWithProperties;
    alias const( aiScene* ) function( const( aiScene* ), uint ) da_aiApplyPostProcessing;
    alias aiLogStream function( aiDefaultLogStream, const( char )* ) da_aiGetPredefinedLogStream;
    alias void function( const( aiLogStream )* ) da_aiAttachLogStream;
    alias void function( aiBool ) da_aiEnableVerboseLogging;
    alias aiReturn function( const( aiLogStream )* ) da_aiDetachLogStream;
    alias void function() da_aiDetachAllLogStreams;
    alias void function( const( aiScene )* ) da_aiReleaseImport;
    alias const( char )* function() da_aiGetErrorString;
    alias aiBool function( const( char )* ) da_aiIsExtensionSupported;
    alias void function( aiString* ) da_aiGetExtensionList;
    alias void function( const( aiScene )*, aiMemoryInfo* ) da_aiGetMemoryRequirements;
    alias aiPropertyStore* function() da_aiCreatePropertyStore;
    alias void function( aiPropertyStore* ) da_aiReleasePropertyStore;
    alias void function( aiPropertyStore*, const( char )*, int ) da_aiSetImportPropertyInteger;
    alias void function( aiPropertyStore*, const( char )*, float ) da_aiSetImportPropertyFloat;
    alias void function( aiPropertyStore*, const( char )*, const( aiString )* ) da_aiSetImportPropertyString;
    alias void function( aiQuaternion*, const( aiMatrix3x3 )* ) da_aiCreateQuaternionFromMatrix;
    alias void function( const( aiMatrix4x4 )*, aiVector3D*, aiQuaternion*, aiVector3D* ) da_aiDecomposeMatrix;
    alias void function( aiMatrix4x4* ) da_aiTransposeMatrix4;
    alias void function( aiMatrix3x3* ) da_aiTransposeMatrix3;
    alias void function( aiVector3D*, const( aiMatrix3x3 )* ) da_aiTransformVecByMatrix3;
    alias void function( aiVector3D*, const( aiMatrix4x4 )* ) da_aiTransformVecByMatrix4;
    alias void function( aiMatrix4x4*, const( aiMatrix4x4 )* ) da_aiMultiplyMatrix4;
    alias void function( aiMatrix3x3*, const( aiMatrix3x3 )* ) da_aiMultiplyMatrix3;
    alias void function( aiMatrix3x3* ) da_aiIdentityMatrix3;
    alias void function( aiMatrix4x4* ) da_aiIdentityMatrix4;

    // material.h
    alias aiReturn function( const( aiMaterial)*, const( char )*, uint, uint, aiMaterialProperty** ) da_aiGetMaterialProperty;
    alias aiReturn function( const( aiMaterial)*, const( char )*, uint, uint, float*, uint* ) da_aiGetMaterialFloatArray;
    alias aiReturn function( const( aiMaterial)*, const( char )*, uint, uint, int*, uint* ) da_aiGetMaterialIntegerArray;
    alias aiReturn function( const( aiMaterial)*, const( char )*, uint, uint, aiColor4D* ) da_aiGetMaterialColor;
    alias aiReturn function( const( aiMaterial)*, const( char )*, uint, uint, aiString* ) da_aiGetMaterialString;
    alias uint function( const( aiMaterial )*, aiTextureType ) da_aiGetMaterialTextureCount;
    alias aiReturn function( aiTextureType, uint, aiString*, aiTextureMapping* m=null, uint* uvindex = null, float* blend = null, aiTextureOp* op = null, aiTextureMapMode* mm = null, uint* flags = null ) da_aiGetMaterialTexture;

    // version.h
    alias nothrow const(char)* function() da_aiGetLegalString;
    alias nothrow uint function() da_aiGetVersionMinor;
    alias nothrow uint function() da_aiGetVersionMajor;
    alias nothrow uint function() da_aiGetVersionRevision;
    alias nothrow uint function() da_aiGetCompileFlags;
}

__gshared {
    da_aiGetExportFormatCount aiGetExportFormatCount;
    da_aiGetExportFormatDescription aiGetExportFormatDescription;
    da_aiCopyScene aiCopyScene;
    da_aiExportScene aiExportScene;
    da_aiExportSceneEx aiExportSceneEx;
    da_aiExportSceneToBlob aiExportSceneToBlob;
    da_aiReleaseExportBlob aiReleaseExportBlob;
    da_aiImportFile aiImportFile;
    da_aiImportFileEx aiImportFileEx;
    da_aiImportFileExWithProperties aiImportFileExWithProperties;
    da_aiImportFileFromMemory aiImportFileFromMemory;
    da_aiImportFileFromMemoryWithProperties aiImportFileFromMemoryWithProperties;
    da_aiApplyPostProcessing aiApplyPostProcessing;
    da_aiGetPredefinedLogStream aiGetPredefinedLogStream;
    da_aiAttachLogStream aiAttachLogStream;
    da_aiEnableVerboseLogging aiEnableVerboseLogging;
    da_aiDetachLogStream aiDetachLogStream;
    da_aiDetachAllLogStreams aiDetachAllLogStreams;
    da_aiReleaseImport aiReleaseImport;
    da_aiGetErrorString aiGetErrorString;
    da_aiIsExtensionSupported aiIsExtensionSupported;
    da_aiGetExtensionList aiGetExtensionList;
    da_aiGetMemoryRequirements aiGetMemoryRequirements;
    da_aiCreatePropertyStore aiCreatePropertyStore;
    da_aiReleasePropertyStore aiReleasePropertyStore;
    da_aiSetImportPropertyInteger aiSetImportPropertyInteger;
    da_aiSetImportPropertyFloat aiSetImportPropertyFloat;
    da_aiSetImportPropertyString aiSetImportPropertyString;
    da_aiCreateQuaternionFromMatrix aiCreateQuaternionFromMatrix;
    da_aiDecomposeMatrix aiDecomposeMatrix;
    da_aiTransposeMatrix4 aiTransposeMatrix4;
    da_aiTransposeMatrix3 aiTransposeMatrix3;
    da_aiTransformVecByMatrix3 aiTransformVecByMatrix3;
    da_aiTransformVecByMatrix4 aiTransformVecByMatrix4;
    da_aiMultiplyMatrix4 aiMultiplyMatrix4;
    da_aiMultiplyMatrix3 aiMultiplyMatrix3;
    da_aiIdentityMatrix3 aiIdentityMatrix3;
    da_aiIdentityMatrix4 aiIdentityMatrix4;
    da_aiGetMaterialProperty aiGetMaterialProperty;
    da_aiGetMaterialFloatArray aiGetMaterialFloatArray;
    da_aiGetMaterialIntegerArray aiGetMaterialIntegerArray;
    da_aiGetMaterialColor aiGetMaterialColor;
    da_aiGetMaterialString aiGetMaterialString;
    da_aiGetMaterialTextureCount aiGetMaterialTextureCount;
    da_aiGetMaterialTexture aiGetMaterialTexture;
    da_aiGetLegalString aiGetLegalString;
    da_aiGetVersionMinor aiGetVersionMinor;
    da_aiGetVersionMajor aiGetVersionMajor;
    da_aiGetVersionRevision aiGetVersionRevision;
    da_aiGetCompileFlags aiGetCompileFlags;
}