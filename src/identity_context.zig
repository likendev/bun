pub fn IdentityContext(comptime Key: type) type {
    return struct {
        pub fn hash(this: @This(), key: Key) u64 {
            return key;
        }

        pub fn eql(this: @This(), a: Key, b: Key) bool {
            return a == b;
        }
    };
}

/// When storing hashes as keys in a hash table, we don't want to hash the hashes or else we increase the chance of collisions. This is also marginally faster since it means hashing less stuff.
/// `ArrayIdentityContext` and `IdentityContext` are distinct because ArrayHashMap expects u32 hashes but HashMap expects u64 hashes.
const ArrayIdentityContext = struct {
    pub fn hash(this: @This(), key: u32) u32 {
        return key;
    }

    pub fn eql(this: @This(), a: u32, b: u32) bool {
        return a == b;
    }
};
