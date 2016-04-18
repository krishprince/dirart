# Abstract #
## Purpose ##
Recent years have witnessed tremendous progress in IGRT technology and potential possibilities for adapting treatment planning on a daily basis.  However, there is a lack in having software tools toward this goal. Therefore, we have implemented a software suite, DIRART, for deformable image registration (DIR) plus adaptive radiotherapy (ART) research.

## Method ##
DIRART is a large set of programs developed using MATLAB. It contains DIR algorithms, common ART functions, integrated graphics user interfaces, visualization features, and dose metrics analysis functions. In addition, it complementarily works together with CERR (Computational Environment for Radiotherapy Research) to offer more functions. DIRART is designed around the concepts of the interactive RT objects, including images, structures, doses and deformation vector fields (DVF) etc.

## Results ##
By exchanging RT objects with TPS via DICOM-RT files, DIRART provides a full featured working environment for ART related research tasks. It is capable of transforming dose distributions and structures between the planning CT and the daily images according to the computed DVF so that such RT information could be viewed and evaluated on either image sets. It can also rescale, subtract and sum up the transformed doses, and convert isodose lines to structures. For DIR applications, DIRART is a toolbox which provides 20+ DIR algorithms, including the newer inverse consistency algorithms to provide consistency DVF in both directions with better accuracy. As a DIR research environment, DIRART dose not only provide a good set of image preprocessing algorithms and post-processing functions to facilitate the development and testing of DIR algorithms, but also offers a good amount of options for results visualization, evaluation and validation.

## Conclusion ##
DIRART is designed in a data-oriented style with focus on usability, user-friendliness, performance, accuracy, flexibility, features, configurability and stability. It has great potential for the ART and DIR research.