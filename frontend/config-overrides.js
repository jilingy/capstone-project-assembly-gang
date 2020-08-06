const { override, fixBabelImports, addLessLoader } = require('customize-cra');

module.exports = override(
  fixBabelImports('import', {
    libraryName: 'antd',
    libraryDirectory: 'es',
    style: true,
  }),
  addLessLoader({
    lessOptions: {
      javascriptEnabled: true,
      modifyVars: { 
        '@primary-color'     : '#1DA57A', 
        '@popover-bg'        : '#0080ff', 
        '@border-color-base' : '#000000', 
        '@table-header-bg'   : '#000000',
        '@table-footer-bg'   : '#000000',
        '@table-footer-color': '#000000',
        '@table-header-color': 'white',
        '@label-color': 'white',
        '@link-color': '#1DA57A',
        '@table-bg': '#eef2f3',
        '@popover-customize-border-color' : '#000000',
        '@popover-color': 'white',
        '@popover-background': '#000000',
        '@background-color-light': '#ADD8E6'
      },
    },
  }),
);
