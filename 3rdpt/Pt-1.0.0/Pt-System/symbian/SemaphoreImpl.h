/***************************************************************************
 *   Copyright (C) 2005 by Marc Boris Dürner                               *
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

#ifndef Pt_SemaphoreImpl_h
#define Pt_SemaphoreImpl_h

#include <Pt/Api.h>

#ifndef __SYMBIAN32__
    #include <semaphore.h>
#else
    #include <stdapis/semaphore.h>
#endif

namespace Pt {

namespace System {

    class PT_API SemaphoreImpl {
        public:
            SemaphoreImpl(unsigned int initial = 0);

            ~SemaphoreImpl();

            void wait();

            bool tryWait();

            void post();

        private:
            sem_t _handle;
    };

} // !namespace System

} // !namespace Pt

#endif
