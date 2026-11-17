Through CodePath's AI301 course, I opened a pull request for an open source project that works with James Webb Space Telescope data. My proposed fix keeps the reported number of downloaded files consistent with the actual file list.

The response model stored the list and its count separately, which allowed them to disagree. I changed it to calculate the count directly from the list while preserving the information expected by other parts of the application.

I added eight regression tests, verified that they exposed the original inconsistency, and validated the change against the existing test suite. I also corrected a formatting issue caught during my first validation run.

The pull request is still open and awaiting review. This experience reinforced that a small code change deserves careful testing, compatibility checks, and an honest account of what has and has not been verified.

https://github.com/Snoww3d/jwst-data-analysis/pull/2178
