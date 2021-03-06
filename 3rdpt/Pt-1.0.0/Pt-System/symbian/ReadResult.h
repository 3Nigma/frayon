/***************************************************************************
 *   Copyright (C) 2006-2007 Laurentiu-Gheorghe Crisan                     *
 *   Copyright (C) 2006-2007 Marc Boris Duerner                            *
 *   Copyright (C) 2008 Peter Barth                                        *
 *   Copyright (C) 2006-2008 PTV AG                                        *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU Library General Public License as       *
 *   published by the Free Software Foundation; either version 2 of the    *
 *   License, or (at your option) any later version.                       *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU Library General Public     *
 *   License along with this program; if not, write to the                 *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/
#ifndef PT_SYSTEM_READRESULT_H
#define PT_SYSTEM_READRESULT_H

#include "IOResultImpl.h"

#include <sys/select.h>
#include <sys/time.h>
#include <unistd.h>
#include <string.h>
#include <cerrno>

// symbian APIs
#include <e32base.h>
#include "SymbianTools.h"

namespace Pt {

namespace System {

    class ReadResult : public IOResultImpl
    {
        public:
            ReadResult()
            {}

            virtual void add(fd_set& readFds, fd_set& writeFds)
            {  FD_SET( this->fd(), &readFds ); }

        protected:
            virtual bool _wait(unsigned int msecs)
            {
                fd_set wfds;
                FD_ZERO(&wfds);

                fd_set fds;
                FD_ZERO(&fds);
                FD_SET(  this->fd(), &fds );

                return select( this->fd(), fds, wfds, msecs);
            }
    };
    
}//namespace System

}//namespace Pt

#endif
