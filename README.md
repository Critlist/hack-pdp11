# Hack for PDP-11 (Huisjes & de Wilde)

Unmodified source code for the PDP-11 version of Hack by **Michiel Huisjes**
and **Fred de Wilde** of the Vrije Universiteit, Amsterdam. This version
bridges Jay Fenlason's original 1982 Hack and the later Hack 1.0 distributed
by Andries Brouwer at CWI.

This repository preserves two distributions of the same codebase:

- **`hack-pdp11/`** — PDP-11/44 and PDP-11/45 source, extracted from a single
  shar file (`source.txt`). Links `-ltermlib`.
- **`pcix/`** — PC/IX (IBM PC UNIX) port, extracted from a 5-part Usenet
  `net.sources.games` posting. Adds `string.s` (assembly string routines) and
  links `-ltermcap` instead of `-ltermlib`.

## Provenance

Both distributions were recovered from the Usenet archives preserved by the
[SuperGlobalMegaCorp Altavista Archive](https://altavista.superglobalmegacorp.com/).
The PDP-11 shar files were manually assembled from five individual postings;
the PC/IX parts were extracted from the related `net.sources.games` group.

**PDP-11 source** (`net.sources`):
- [Part 1](https://altavista.superglobalmegacorp.com/usenet/news021f2/b37/net/sources/2483.txt)
- [Part 2](https://altavista.superglobalmegacorp.com/usenet/news021f2/b37/net/sources/2484.txt)
- [Part 3](https://altavista.superglobalmegacorp.com/usenet/news021f2/b37/net/sources/2485.txt)
- [Part 4](https://altavista.superglobalmegacorp.com/usenet/news021f2/b37/net/sources/2486.txt)
- [Part 5](https://altavista.superglobalmegacorp.com/usenet/news021f2/b37/net/sources/2493.txt)
- [Full archive directory](https://altavista.superglobalmegacorp.com/usenet/news021f2/b37/net/sources/)

**PC/IX source** (`net.sources.games`):
- [Part 1](https://altavista.superglobalmegacorp.com/usenet/news026f2/b46/net/sources/games/107.txt)
- [Part 2](https://altavista.superglobalmegacorp.com/usenet/news026f2/b46/net/sources/games/110.txt)
- [Part 3](https://altavista.superglobalmegacorp.com/usenet/news026f2/b46/net/sources/games/111.txt)
- [Part 4](https://altavista.superglobalmegacorp.com/usenet/news026f2/b46/net/sources/games/108.txt)
- [Part 5](https://altavista.superglobalmegacorp.com/usenet/news026f2/b46/net/sources/games/109.txt)

## Authors

From the READ_ME:

> Some additions we (Fred de Wilde and Michiel Huisjes) made are
> - The Vault
> - The Swamp
> - The Zoo
> - The Graveyard
> - Maxlevel = 40
> - Proper Saving
> - Several bugs
> - And many, many more...

Contact (original): `{seismo|decvax|philabs}!mcvac!vu44!ark!huisjes`

The wizard is defined as `"huisjes"` in `envir.h`.

## Differences from Fenlason Hack (1982)

This version represents a substantial expansion over Fenlason's original:

| Feature | Fenlason | PDP-11/PC/IX |
|---------|----------|--------------|
| Source files | ~8 | ~45 |
| Dungeon features | rooms, corridors, maze | + vault, swamp, zoo, graveyard |
| Creatures | basic monsters | + dogs, worms, shopkeepers |
| Max level | 30 | 40 |
| Save system | basic | proper save/restore |
| Bones files | no | yes |
| Inventory | minimal | full system with wear/wield |
| Record file | text | binary (with `show -r` viewer) |

## Differences Between PDP-11 and PC/IX

The two distributions are nearly identical. Known differences:

- PC/IX adds `string.s` — assembly language string routines for the IBM PC
- PC/IX Makefile links `-ltermcap`; PDP-11 links `-ltermlib`
- PC/IX Makefile includes `string.o` in HOBJ
- PDP-11 distribution includes `help` and `READ_ME`; PC/IX omits both

## Building

These sources target V7/2BSD Unix on a PDP-11 and will not compile on modern
systems without modification. They are preserved here as historical artifacts.

The original build instructions from the READ_ME:

> Edit the file `envir.h` to define the local parameters. Edit the Makefile
> to define the playdir directory (default /usr/games). Determine who will be
> the owner of the game, since it has the setuid bits on. [...] Now type
> `make` and the file `hack`, `mklev` and `show` will be created.

## Related Projects

- [fenlason-hack](https://github.com/Critlist/fenlason-hack) — Jay Fenlason's
  original 1982 Hack from Lincoln-Sudbury Regional High School
- [restoHack](https://github.com/Critlist/restoHack) — Restoration of
  Hack v1.0.3 for modern systems

## License

This source code predates modern open source licensing. It is preserved here
for historical and educational purposes.
