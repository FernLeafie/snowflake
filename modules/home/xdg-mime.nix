{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.dataFile = {
    "mime/packages/image-ase.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
          <mime-type type="image/ase">
              <comment>Aseprite file</comment>
              <icon name="image-aseprite"/>
              <glob-deleteall/>
              <glob pattern="*.ase"/>
              <glob pattern="*.aseprite"/>
          </mime-type>
      </mime-info>
    '';
    "mime/packages/model-bbmodel.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
          <mime-type type="model/bbmodel">
              <comment>Blockbench 3D model</comment>
              <icon name="blockbench"/>
              <glob-deleteall/>
              <glob pattern="*.bbmodel"/>
          </mime-type>
      </mime-info>
    '';
    "mime/packages/text-x-less.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
          <mime-type type="text/x-less">
              <icon name="text-css"/>
              <glob-deleteall/>
              <glob pattern="*.less"/>
          </mime-type>
      </mime-info>
    '';
    "mime/packages/text-x-nix.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
          <mime-type type="text/x-nix">
              <comment>Nix source code</comment>
              <icon name="text-x-nix"/>
              <glob-deleteall/>
              <glob pattern="*.nix"/>
              <glob pattern="flake.lock"/>
          </mime-type>
      </mime-info>
    '';
    "mime/packages/text-x-typst.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
          <mime-type type="text/x-typst">
              <comment>Typst document</comment>
              <icon name="text-x-typst"/>
              <glob-deleteall/>
              <glob pattern="*.typ"/>
          </mime-type>
      </mime-info>
    '';
  };
}
