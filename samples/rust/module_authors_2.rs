// SPDX-License-Identifier: GPL-2.0

//! Rust authors sample.

use kernel::prelude::*;

module! {
    type: ModuleAuthors,
    name: "module_authors",
    authors: [ 
        "author_6",
        "author_1",
        "author_2",
        "author_3",
        "author_4",
    ],
    license: "GPL",
    alias: [ "a1"],
    firmware: ["f1"],
}

struct ModuleAuthors;

impl kernel::Module for ModuleAuthors {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        pr_info!("I'm a module authors\n");
        Ok(ModuleAuthors)
    }
}

impl Drop for ModuleAuthors {
    fn drop(&mut self) {
        pr_info!("bye bye module authors\n");
    }
}
