// SPDX-License-Identifier: GPL-2.0

//! documentation

use kernel::prelude::*;
use kernel::sync::{new_mutex, Mutex};

module! {
    type: LockGetMut,
    name: "LockGetMut",
    author: "guilherme",
    description: "lockgetmut test",
    license: "GPL",
}

struct Inner {
    a: u32,
}

#[pin_data]
struct Example {
    #[pin]
    d: Mutex<Inner>,
}

impl Example {
    fn new() -> impl PinInit<Self> {
        pin_init!(Self {
            d <- new_mutex!(Inner { a: 20 })
        })
    }
}

struct LockGetMut;
impl kernel::Module for LockGetMut {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        let mut pin = KBox::pin_init(Example::new(), GFP_KERNEL)?;
        let mut_pin = pin.as_mut();

        let data = unsafe { Pin::get_unchecked_mut(mut_pin).d.get_mut() };
        assert_eq!(data.a, 20);

        Ok(LockGetMut)
    }
}

impl Drop for LockGetMut {
    fn drop(&mut self) {
        pr_info!("keyword - bye bye test for lock get mut\n");
    }
}
