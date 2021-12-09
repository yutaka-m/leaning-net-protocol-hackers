import os
import errno

err = 14
print(errno.errorcode[err])
print(os.strerror(err))
