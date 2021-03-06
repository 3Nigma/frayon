/*
 * Copyright (C) 2006-2013 Marc Boris Duerner
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * As a special exception, you may use this file as part of a free
 * software library without restriction. Specifically, if other files
 * instantiate templates or use macros or inline functions from this
 * file, or you compile this file and link it with other files to
 * produce an executable, this file does not by itself cause the
 * resulting executable to be covered by the GNU General Public
 * License. This exception does not however invalidate any other
 * reasons why the executable file might be covered by the GNU Library
 * General Public License.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#ifndef Pt_System_Timer_h
#define Pt_System_Timer_h

#include <Pt/System/Api.h>
#include <Pt/Signal.h>
#include <Pt/Timespan.h>
#include <cstddef>

namespace Pt {

namespace System {

/** @brief Notifies clients in constant intervals

    Timers can be used to be notified if a time interval expires. It
    usually works with an event loop, where the Timer
    needs to be registered. Timers send the timeout signal
    in given intervals, to which the interested clients connect. The
    interval can be changed at any time and timers
    can switch between an active and inactive state.
    The following code calls the function onTimer every second:
    @code
    void onTimer()
    {
        std::cerr << "Time out!\n";
    }

    int main()
    {
        Pt::System::EventLoop loop;
  
        Pt::System::Timer timer;
        timer.timeout() += Pt::slot(onTimer);
        timer.setActive(loop);
        timer.start(1000);

        loop.run();
        return 0;
    }
    @endcode
*/
class PT_SYSTEM_API Timer
{
    class Sentry;

    public:
        /** @brief Default constructor

            Constructs an inactive timer.
        */
        Timer();

        /** @brief Destructor

            The destructor sends the destroyed signal.
        */
        ~Timer();

        EventLoop* parent()
        { return _loop; }

        EventLoop* loop()
        { return _loop; }

        void setActive(EventLoop& loop);

        void detach();

        /** @brief Returs true if timer was started
        */
        bool isStarted() const;

        /** @brief Returns the current timer interval

            Returns the current interval of the timer in milliseconds.
        */
        std::size_t interval() const;

        /** @brief Starts the timer

            Start a timer from the moment this method is called. The
            Timer needs to be registered with an event loop,
            otherwise the timeout signal will not be sent.

            @param interval Timeout interval in milliseconds
        */
        void start(std::size_t interval);

        /** @brief Stops the timer

            If the Timer is registered with an event loop,
            the timout signal will not be sent anymore.
        */
        void stop();

        /** @brief Update the timer

            This method is supposed to be called by the
            event loop. If the interval timeout is passed the Timer
            will send the timeout signal and return true, otherwise
            internal times are updated and false is returned.
        */
        bool update();

        bool update(const Timespan& now);

        /** @brief Notifies about interval timeouts

            This signal is sent if the interval time has expired.
        */
        Signal<>& timeout()
        { return _timeout; }

        const Timespan& finished() const
        { return _finished; }

    private:
        Sentry*     _sentry;
        EventLoop*  _loop;
        std::size_t _interval;
        Timespan    _finished;
        Signal<>    _timeout;
        void*       _reserved;
};

} // namespace System

} // namespace Pt

#endif // Pt_System_Timer_h
