// DO NOT EDIT - This is a generated file.

// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: unnecessary_getters_setters
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: require_trailing_commas
// ignore_for_file: unnecessary_cast
// ignore_for_file: avoid_single_cascade_in_expression_statements
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: unused_element

part of 'mapbox_style.dart';

/// Whether extruded geometries are lit relative to the map or viewport.
enum LightAnchor {
  /// The position of the light source is aligned to the rotation of the map.
  map,

  /// The position of the light source is aligned to the rotation of the viewport.
  viewport,
}

extension LightAnchorExtension on LightAnchor {
  Object toJson() {
    switch (this) {
      case LightAnchor.map:
        return 'map';
      case LightAnchor.viewport:
        return 'viewport';
    }
  }
}

LightAnchor? _parseFromJsonAsLightAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return LightAnchor.map;
    case 'viewport':
      return LightAnchor.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// A source type.
enum SourceType {
  /// A vector tile source.
  vector,

  /// A raster tile source.
  raster,

  /// A RGB-encoded raster DEM source
  rasterDem,

  /// A GeoJSON data source.
  geojson,

  /// A video data source.
  video,

  /// An image data source.
  image,
}

extension SourceTypeExtension on SourceType {
  Object toJson() {
    switch (this) {
      case SourceType.vector:
        return 'vector';
      case SourceType.raster:
        return 'raster';
      case SourceType.rasterDem:
        return 'raster-dem';
      case SourceType.geojson:
        return 'geojson';
      case SourceType.video:
        return 'video';
      case SourceType.image:
        return 'image';
    }
  }
}

SourceType? _parseFromJsonAsSourceType(
  DataContext context,
) {
  switch (context.value) {
    case 'vector':
      return SourceType.vector;
    case 'raster':
      return SourceType.raster;
    case 'raster-dem':
      return SourceType.rasterDem;
    case 'geojson':
      return SourceType.geojson;
    case 'video':
      return SourceType.video;
    case 'image':
      return SourceType.image;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Influences the y direction of the tile coordinates. The global-mercator (aka Spherical Mercator) profile is assumed.
enum TileScheme {
  /// Slippy map tilenames scheme.
  xyz,

  /// OSGeo spec scheme.
  tms,
}

extension TileSchemeExtension on TileScheme {
  Object toJson() {
    switch (this) {
      case TileScheme.xyz:
        return 'xyz';
      case TileScheme.tms:
        return 'tms';
    }
  }
}

TileScheme? _parseFromJsonAsTileScheme(
  DataContext context,
) {
  switch (context.value) {
    case 'xyz':
      return TileScheme.xyz;
    case 'tms':
      return TileScheme.tms;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// The encoding used by this source. Mapbox Terrain RGB is used by default
enum DemEncoding {
  /// Terrarium format PNG tiles. See https://aws.amazon.com/es/public-datasets/terrain/ for more info.
  terrarium,

  /// Mapbox Terrain RGB tiles. See https://www.mapbox.com/help/access-elevation-data/#mapbox-terrain-rgb for more info.
  mapbox,
}

extension DemEncodingExtension on DemEncoding {
  Object toJson() {
    switch (this) {
      case DemEncoding.terrarium:
        return 'terrarium';
      case DemEncoding.mapbox:
        return 'mapbox';
    }
  }
}

DemEncoding? _parseFromJsonAsDemEncoding(
  DataContext context,
) {
  switch (context.value) {
    case 'terrarium':
      return DemEncoding.terrarium;
    case 'mapbox':
      return DemEncoding.mapbox;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// The name of the projection to be used for rendering the map.
enum ProjectionName {
  /// An Albers equal-area projection centered on the continental United States. You can configure the projection for a different region by setting `center` and `parallels` properties. You may want to set max bounds to constrain the map to the relevant region.
  albers,

  /// An Equal Earth projection.
  equalEarth,

  /// An Equirectangular projection. This projection is very similar to the Plate Carrée projection.
  equirectangular,

  /// A Lambert conformal conic projection. You can configure the projection for a region by setting `center` and `parallels` properties. You may want to set max bounds to constrain the map to the relevant region.
  lambertConformalConic,

  /// The Mercator projection is the default projection.
  mercator,

  /// A Natural Earth projection.
  naturalEarth,

  /// A Winkel Tripel projection.
  winkelTripel,
}

extension ProjectionNameExtension on ProjectionName {
  Object toJson() {
    switch (this) {
      case ProjectionName.albers:
        return 'albers';
      case ProjectionName.equalEarth:
        return 'equalEarth';
      case ProjectionName.equirectangular:
        return 'equirectangular';
      case ProjectionName.lambertConformalConic:
        return 'lambertConformalConic';
      case ProjectionName.mercator:
        return 'mercator';
      case ProjectionName.naturalEarth:
        return 'naturalEarth';
      case ProjectionName.winkelTripel:
        return 'winkelTripel';
    }
  }
}

ProjectionName? _parseFromJsonAsProjectionName(
  DataContext context,
) {
  switch (context.value) {
    case 'albers':
      return ProjectionName.albers;
    case 'equalEarth':
      return ProjectionName.equalEarth;
    case 'equirectangular':
      return ProjectionName.equirectangular;
    case 'lambertConformalConic':
      return ProjectionName.lambertConformalConic;
    case 'mercator':
      return ProjectionName.mercator;
    case 'naturalEarth':
      return ProjectionName.naturalEarth;
    case 'winkelTripel':
      return ProjectionName.winkelTripel;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Whether this layer is displayed.
enum LayerVisibility {
  /// The layer is shown.
  visible,

  /// The layer is not shown.
  none,
}

extension LayerVisibilityExtension on LayerVisibility {
  Object toJson() {
    switch (this) {
      case LayerVisibility.visible:
        return 'visible';
      case LayerVisibility.none:
        return 'none';
    }
  }
}

LayerVisibility? _parseFromJsonAsLayerVisibility(
  DataContext context,
) {
  switch (context.value) {
    case 'visible':
      return LayerVisibility.visible;
    case 'none':
      return LayerVisibility.none;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// The display of line endings.
enum LineCap {
  /// A cap with a squared-off end which is drawn to the exact endpoint of the line.
  butt,

  /// A cap with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
  round,

  /// A cap with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
  square,
}

extension LineCapExtension on LineCap {
  Object toJson() {
    switch (this) {
      case LineCap.butt:
        return 'butt';
      case LineCap.round:
        return 'round';
      case LineCap.square:
        return 'square';
    }
  }
}

LineCap? _parseFromJsonAsLineCap(
  DataContext context,
) {
  switch (context.value) {
    case 'butt':
      return LineCap.butt;
    case 'round':
      return LineCap.round;
    case 'square':
      return LineCap.square;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// The display of lines when joining.
enum LineJoin {
  /// A join with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
  bevel,

  /// A join with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
  round,

  /// A join with a sharp, angled corner which is drawn with the outer sides beyond the endpoint of the path until they meet.
  miter,
}

extension LineJoinExtension on LineJoin {
  Object toJson() {
    switch (this) {
      case LineJoin.bevel:
        return 'bevel';
      case LineJoin.round:
        return 'round';
      case LineJoin.miter:
        return 'miter';
    }
  }
}

LineJoin? _parseFromJsonAsLineJoin(
  DataContext context,
) {
  switch (context.value) {
    case 'bevel':
      return LineJoin.bevel;
    case 'round':
      return LineJoin.round;
    case 'miter':
      return LineJoin.miter;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Label placement relative to its geometry.
enum SymbolPlacement {
  /// The label is placed at the point where the geometry is located.
  point,

  /// The label is placed along the line of the geometry. Can only be used on `LineString` and `Polygon` geometries.
  line,

  /// The label is placed at the center of the line of the geometry. Can only be used on `LineString` and `Polygon` geometries. Note that a single feature in a vector tile may contain multiple line geometries.
  lineCenter,
}

extension SymbolPlacementExtension on SymbolPlacement {
  Object toJson() {
    switch (this) {
      case SymbolPlacement.point:
        return 'point';
      case SymbolPlacement.line:
        return 'line';
      case SymbolPlacement.lineCenter:
        return 'line-center';
    }
  }
}

SymbolPlacement? _parseFromJsonAsSymbolPlacement(
  DataContext context,
) {
  switch (context.value) {
    case 'point':
      return SymbolPlacement.point;
    case 'line':
      return SymbolPlacement.line;
    case 'line-center':
      return SymbolPlacement.lineCenter;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
enum SymbolZOrder {
  /// Sorts symbols by `symbol-sort-key` if set. Otherwise, sorts symbols by their y-position relative to the viewport if `icon-allow-overlap` or `text-allow-overlap` is set to `true` or `icon-ignore-placement` or `text-ignore-placement` is `false`.
  auto,

  /// Sorts symbols by their y-position relative to the viewport if `icon-allow-overlap` or `text-allow-overlap` is set to `true` or `icon-ignore-placement` or `text-ignore-placement` is `false`.
  viewportY,

  /// Sorts symbols by `symbol-sort-key` if set. Otherwise, no sorting is applied; symbols are rendered in the same order as the source data.
  source,
}

extension SymbolZOrderExtension on SymbolZOrder {
  Object toJson() {
    switch (this) {
      case SymbolZOrder.auto:
        return 'auto';
      case SymbolZOrder.viewportY:
        return 'viewport-y';
      case SymbolZOrder.source:
        return 'source';
    }
  }
}

SymbolZOrder? _parseFromJsonAsSymbolZOrder(
  DataContext context,
) {
  switch (context.value) {
    case 'auto':
      return SymbolZOrder.auto;
    case 'viewport-y':
      return SymbolZOrder.viewportY;
    case 'source':
      return SymbolZOrder.source;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// In combination with `symbol-placement`, determines the rotation behavior of icons.
enum IconRotationAlignment {
  /// When `symbol-placement` is set to `point`, aligns icons east-west. When `symbol-placement` is set to `line` or `line-center`, aligns icon x-axes with the line.
  map,

  /// Produces icons whose x-axes are aligned with the x-axis of the viewport, regardless of the value of `symbol-placement`.
  viewport,

  /// When `symbol-placement` is set to `point`, this is equivalent to `viewport`. When `symbol-placement` is set to `line` or `line-center`, this is equivalent to `map`.
  auto,
}

extension IconRotationAlignmentExtension on IconRotationAlignment {
  Object toJson() {
    switch (this) {
      case IconRotationAlignment.map:
        return 'map';
      case IconRotationAlignment.viewport:
        return 'viewport';
      case IconRotationAlignment.auto:
        return 'auto';
    }
  }
}

IconRotationAlignment? _parseFromJsonAsIconRotationAlignment(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return IconRotationAlignment.map;
    case 'viewport':
      return IconRotationAlignment.viewport;
    case 'auto':
      return IconRotationAlignment.auto;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Scales the icon to fit around the associated text.
enum IconTextFit {
  /// The icon is displayed at its intrinsic aspect ratio.
  none,

  /// The icon is scaled in the x-dimension to fit the width of the text.
  width,

  /// The icon is scaled in the y-dimension to fit the height of the text.
  height,

  /// The icon is scaled in both x- and y-dimensions.
  both,
}

extension IconTextFitExtension on IconTextFit {
  Object toJson() {
    switch (this) {
      case IconTextFit.none:
        return 'none';
      case IconTextFit.width:
        return 'width';
      case IconTextFit.height:
        return 'height';
      case IconTextFit.both:
        return 'both';
    }
  }
}

IconTextFit? _parseFromJsonAsIconTextFit(
  DataContext context,
) {
  switch (context.value) {
    case 'none':
      return IconTextFit.none;
    case 'width':
      return IconTextFit.width;
    case 'height':
      return IconTextFit.height;
    case 'both':
      return IconTextFit.both;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Part of the icon placed closest to the anchor.
enum IconAnchor {
  /// The center of the icon is placed closest to the anchor.
  center,

  /// The left side of the icon is placed closest to the anchor.
  left,

  /// The right side of the icon is placed closest to the anchor.
  right,

  /// The top of the icon is placed closest to the anchor.
  top,

  /// The bottom of the icon is placed closest to the anchor.
  bottom,

  /// The top left corner of the icon is placed closest to the anchor.
  topLeft,

  /// The top right corner of the icon is placed closest to the anchor.
  topRight,

  /// The bottom left corner of the icon is placed closest to the anchor.
  bottomLeft,

  /// The bottom right corner of the icon is placed closest to the anchor.
  bottomRight,
}

extension IconAnchorExtension on IconAnchor {
  Object toJson() {
    switch (this) {
      case IconAnchor.center:
        return 'center';
      case IconAnchor.left:
        return 'left';
      case IconAnchor.right:
        return 'right';
      case IconAnchor.top:
        return 'top';
      case IconAnchor.bottom:
        return 'bottom';
      case IconAnchor.topLeft:
        return 'top-left';
      case IconAnchor.topRight:
        return 'top-right';
      case IconAnchor.bottomLeft:
        return 'bottom-left';
      case IconAnchor.bottomRight:
        return 'bottom-right';
    }
  }
}

IconAnchor? _parseFromJsonAsIconAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'center':
      return IconAnchor.center;
    case 'left':
      return IconAnchor.left;
    case 'right':
      return IconAnchor.right;
    case 'top':
      return IconAnchor.top;
    case 'bottom':
      return IconAnchor.bottom;
    case 'top-left':
      return IconAnchor.topLeft;
    case 'top-right':
      return IconAnchor.topRight;
    case 'bottom-left':
      return IconAnchor.bottomLeft;
    case 'bottom-right':
      return IconAnchor.bottomRight;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Orientation of icon when map is pitched.
enum IconPitchAlignment {
  /// The icon is aligned to the plane of the map.
  map,

  /// The icon is aligned to the plane of the viewport.
  viewport,

  /// Automatically matches the value of `icon-rotation-alignment`.
  auto,
}

extension IconPitchAlignmentExtension on IconPitchAlignment {
  Object toJson() {
    switch (this) {
      case IconPitchAlignment.map:
        return 'map';
      case IconPitchAlignment.viewport:
        return 'viewport';
      case IconPitchAlignment.auto:
        return 'auto';
    }
  }
}

IconPitchAlignment? _parseFromJsonAsIconPitchAlignment(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return IconPitchAlignment.map;
    case 'viewport':
      return IconPitchAlignment.viewport;
    case 'auto':
      return IconPitchAlignment.auto;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Orientation of text when map is pitched.
enum TextPitchAlignment {
  /// The text is aligned to the plane of the map.
  map,

  /// The text is aligned to the plane of the viewport.
  viewport,

  /// Automatically matches the value of `text-rotation-alignment`.
  auto,
}

extension TextPitchAlignmentExtension on TextPitchAlignment {
  Object toJson() {
    switch (this) {
      case TextPitchAlignment.map:
        return 'map';
      case TextPitchAlignment.viewport:
        return 'viewport';
      case TextPitchAlignment.auto:
        return 'auto';
    }
  }
}

TextPitchAlignment? _parseFromJsonAsTextPitchAlignment(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return TextPitchAlignment.map;
    case 'viewport':
      return TextPitchAlignment.viewport;
    case 'auto':
      return TextPitchAlignment.auto;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
enum TextRotationAlignment {
  /// When `symbol-placement` is set to `point`, aligns text east-west. When `symbol-placement` is set to `line` or `line-center`, aligns text x-axes with the line.
  map,

  /// Produces glyphs whose x-axes are aligned with the x-axis of the viewport, regardless of the value of `symbol-placement`.
  viewport,

  /// When `symbol-placement` is set to `point`, this is equivalent to `viewport`. When `symbol-placement` is set to `line` or `line-center`, this is equivalent to `map`.
  auto,
}

extension TextRotationAlignmentExtension on TextRotationAlignment {
  Object toJson() {
    switch (this) {
      case TextRotationAlignment.map:
        return 'map';
      case TextRotationAlignment.viewport:
        return 'viewport';
      case TextRotationAlignment.auto:
        return 'auto';
    }
  }
}

TextRotationAlignment? _parseFromJsonAsTextRotationAlignment(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return TextRotationAlignment.map;
    case 'viewport':
      return TextRotationAlignment.viewport;
    case 'auto':
      return TextRotationAlignment.auto;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Text justification options.
enum TextJustify {
  /// The text is aligned towards the anchor position.
  auto,

  /// The text is aligned to the left.
  left,

  /// The text is centered.
  center,

  /// The text is aligned to the right.
  right,
}

extension TextJustifyExtension on TextJustify {
  Object toJson() {
    switch (this) {
      case TextJustify.auto:
        return 'auto';
      case TextJustify.left:
        return 'left';
      case TextJustify.center:
        return 'center';
      case TextJustify.right:
        return 'right';
    }
  }
}

TextJustify? _parseFromJsonAsTextJustify(
  DataContext context,
) {
  switch (context.value) {
    case 'auto':
      return TextJustify.auto;
    case 'left':
      return TextJustify.left;
    case 'center':
      return TextJustify.center;
    case 'right':
      return TextJustify.right;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
enum TextVariableAnchor {
  /// The center of the text is placed closest to the anchor.
  center,

  /// The left side of the text is placed closest to the anchor.
  left,

  /// The right side of the text is placed closest to the anchor.
  right,

  /// The top of the text is placed closest to the anchor.
  top,

  /// The bottom of the text is placed closest to the anchor.
  bottom,

  /// The top left corner of the text is placed closest to the anchor.
  topLeft,

  /// The top right corner of the text is placed closest to the anchor.
  topRight,

  /// The bottom left corner of the text is placed closest to the anchor.
  bottomLeft,

  /// The bottom right corner of the text is placed closest to the anchor.
  bottomRight,
}

extension TextVariableAnchorExtension on TextVariableAnchor {
  Object toJson() {
    switch (this) {
      case TextVariableAnchor.center:
        return 'center';
      case TextVariableAnchor.left:
        return 'left';
      case TextVariableAnchor.right:
        return 'right';
      case TextVariableAnchor.top:
        return 'top';
      case TextVariableAnchor.bottom:
        return 'bottom';
      case TextVariableAnchor.topLeft:
        return 'top-left';
      case TextVariableAnchor.topRight:
        return 'top-right';
      case TextVariableAnchor.bottomLeft:
        return 'bottom-left';
      case TextVariableAnchor.bottomRight:
        return 'bottom-right';
    }
  }
}

TextVariableAnchor? _parseFromJsonAsTextVariableAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'center':
      return TextVariableAnchor.center;
    case 'left':
      return TextVariableAnchor.left;
    case 'right':
      return TextVariableAnchor.right;
    case 'top':
      return TextVariableAnchor.top;
    case 'bottom':
      return TextVariableAnchor.bottom;
    case 'top-left':
      return TextVariableAnchor.topLeft;
    case 'top-right':
      return TextVariableAnchor.topRight;
    case 'bottom-left':
      return TextVariableAnchor.bottomLeft;
    case 'bottom-right':
      return TextVariableAnchor.bottomRight;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Part of the text placed closest to the anchor.
enum TextAnchor {
  /// The center of the text is placed closest to the anchor.
  center,

  /// The left side of the text is placed closest to the anchor.
  left,

  /// The right side of the text is placed closest to the anchor.
  right,

  /// The top of the text is placed closest to the anchor.
  top,

  /// The bottom of the text is placed closest to the anchor.
  bottom,

  /// The top left corner of the text is placed closest to the anchor.
  topLeft,

  /// The top right corner of the text is placed closest to the anchor.
  topRight,

  /// The bottom left corner of the text is placed closest to the anchor.
  bottomLeft,

  /// The bottom right corner of the text is placed closest to the anchor.
  bottomRight,
}

extension TextAnchorExtension on TextAnchor {
  Object toJson() {
    switch (this) {
      case TextAnchor.center:
        return 'center';
      case TextAnchor.left:
        return 'left';
      case TextAnchor.right:
        return 'right';
      case TextAnchor.top:
        return 'top';
      case TextAnchor.bottom:
        return 'bottom';
      case TextAnchor.topLeft:
        return 'top-left';
      case TextAnchor.topRight:
        return 'top-right';
      case TextAnchor.bottomLeft:
        return 'bottom-left';
      case TextAnchor.bottomRight:
        return 'bottom-right';
    }
  }
}

TextAnchor? _parseFromJsonAsTextAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'center':
      return TextAnchor.center;
    case 'left':
      return TextAnchor.left;
    case 'right':
      return TextAnchor.right;
    case 'top':
      return TextAnchor.top;
    case 'bottom':
      return TextAnchor.bottom;
    case 'top-left':
      return TextAnchor.topLeft;
    case 'top-right':
      return TextAnchor.topRight;
    case 'bottom-left':
      return TextAnchor.bottomLeft;
    case 'bottom-right':
      return TextAnchor.bottomRight;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
enum TextWritingMode {
  /// If a text's language supports horizontal writing mode, symbols would be laid out horizontally.
  horizontal,

  /// If a text's language supports vertical writing mode, symbols would be laid out vertically.
  vertical,
}

extension TextWritingModeExtension on TextWritingMode {
  Object toJson() {
    switch (this) {
      case TextWritingMode.horizontal:
        return 'horizontal';
      case TextWritingMode.vertical:
        return 'vertical';
    }
  }
}

TextWritingMode? _parseFromJsonAsTextWritingMode(
  DataContext context,
) {
  switch (context.value) {
    case 'horizontal':
      return TextWritingMode.horizontal;
    case 'vertical':
      return TextWritingMode.vertical;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Specifies how to capitalize text, similar to the CSS `text-transform` property.
enum TextTransform {
  /// The text is not altered.
  none,

  /// Forces all letters to be displayed in uppercase.
  uppercase,

  /// Forces all letters to be displayed in lowercase.
  lowercase,
}

extension TextTransformExtension on TextTransform {
  Object toJson() {
    switch (this) {
      case TextTransform.none:
        return 'none';
      case TextTransform.uppercase:
        return 'uppercase';
      case TextTransform.lowercase:
        return 'lowercase';
    }
  }
}

TextTransform? _parseFromJsonAsTextTransform(
  DataContext context,
) {
  switch (context.value) {
    case 'none':
      return TextTransform.none;
    case 'uppercase':
      return TextTransform.uppercase;
    case 'lowercase':
      return TextTransform.lowercase;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Controls the frame of reference for `fill-translate`.
enum FillTranslateAnchor {
  /// The fill is translated relative to the map.
  map,

  /// The fill is translated relative to the viewport.
  viewport,
}

extension FillTranslateAnchorExtension on FillTranslateAnchor {
  Object toJson() {
    switch (this) {
      case FillTranslateAnchor.map:
        return 'map';
      case FillTranslateAnchor.viewport:
        return 'viewport';
    }
  }
}

FillTranslateAnchor? _parseFromJsonAsFillTranslateAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return FillTranslateAnchor.map;
    case 'viewport':
      return FillTranslateAnchor.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Controls the frame of reference for `line-translate`.
enum LineTranslateAnchor {
  /// The line is translated relative to the map.
  map,

  /// The line is translated relative to the viewport.
  viewport,
}

extension LineTranslateAnchorExtension on LineTranslateAnchor {
  Object toJson() {
    switch (this) {
      case LineTranslateAnchor.map:
        return 'map';
      case LineTranslateAnchor.viewport:
        return 'viewport';
    }
  }
}

LineTranslateAnchor? _parseFromJsonAsLineTranslateAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return LineTranslateAnchor.map;
    case 'viewport':
      return LineTranslateAnchor.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Controls the frame of reference for `circle-translate`.
enum CircleTranslateAnchor {
  /// The circle is translated relative to the map.
  map,

  /// The circle is translated relative to the viewport.
  viewport,
}

extension CircleTranslateAnchorExtension on CircleTranslateAnchor {
  Object toJson() {
    switch (this) {
      case CircleTranslateAnchor.map:
        return 'map';
      case CircleTranslateAnchor.viewport:
        return 'viewport';
    }
  }
}

CircleTranslateAnchor? _parseFromJsonAsCircleTranslateAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return CircleTranslateAnchor.map;
    case 'viewport':
      return CircleTranslateAnchor.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Controls the scaling behavior of the circle when the map is pitched.
enum CirclePitchScale {
  /// Circles are scaled according to their apparent distance to the camera.
  map,

  /// Circles are not scaled.
  viewport,
}

extension CirclePitchScaleExtension on CirclePitchScale {
  Object toJson() {
    switch (this) {
      case CirclePitchScale.map:
        return 'map';
      case CirclePitchScale.viewport:
        return 'viewport';
    }
  }
}

CirclePitchScale? _parseFromJsonAsCirclePitchScale(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return CirclePitchScale.map;
    case 'viewport':
      return CirclePitchScale.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Orientation of circle when map is pitched.
enum CirclePitchAlignment {
  /// The circle is aligned to the plane of the map.
  map,

  /// The circle is aligned to the plane of the viewport.
  viewport,
}

extension CirclePitchAlignmentExtension on CirclePitchAlignment {
  Object toJson() {
    switch (this) {
      case CirclePitchAlignment.map:
        return 'map';
      case CirclePitchAlignment.viewport:
        return 'viewport';
    }
  }
}

CirclePitchAlignment? _parseFromJsonAsCirclePitchAlignment(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return CirclePitchAlignment.map;
    case 'viewport':
      return CirclePitchAlignment.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Controls the frame of reference for `fill-extrusion-translate`.
enum FillExtrusionTranslateAnchor {
  /// The fill extrusion is translated relative to the map.
  map,

  /// The fill extrusion is translated relative to the viewport.
  viewport,
}

extension FillExtrusionTranslateAnchorExtension
    on FillExtrusionTranslateAnchor {
  Object toJson() {
    switch (this) {
      case FillExtrusionTranslateAnchor.map:
        return 'map';
      case FillExtrusionTranslateAnchor.viewport:
        return 'viewport';
    }
  }
}

FillExtrusionTranslateAnchor? _parseFromJsonAsFillExtrusionTranslateAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return FillExtrusionTranslateAnchor.map;
    case 'viewport':
      return FillExtrusionTranslateAnchor.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Controls the frame of reference for `icon-translate`.
enum IconTranslateAnchor {
  /// Icons are translated relative to the map.
  map,

  /// Icons are translated relative to the viewport.
  viewport,
}

extension IconTranslateAnchorExtension on IconTranslateAnchor {
  Object toJson() {
    switch (this) {
      case IconTranslateAnchor.map:
        return 'map';
      case IconTranslateAnchor.viewport:
        return 'viewport';
    }
  }
}

IconTranslateAnchor? _parseFromJsonAsIconTranslateAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return IconTranslateAnchor.map;
    case 'viewport':
      return IconTranslateAnchor.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Controls the frame of reference for `text-translate`.
enum TextTranslateAnchor {
  /// The text is translated relative to the map.
  map,

  /// The text is translated relative to the viewport.
  viewport,
}

extension TextTranslateAnchorExtension on TextTranslateAnchor {
  Object toJson() {
    switch (this) {
      case TextTranslateAnchor.map:
        return 'map';
      case TextTranslateAnchor.viewport:
        return 'viewport';
    }
  }
}

TextTranslateAnchor? _parseFromJsonAsTextTranslateAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return TextTranslateAnchor.map;
    case 'viewport':
      return TextTranslateAnchor.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
enum RasterResampling {
  /// (Bi)linear filtering interpolates pixel values using the weighted average of the four closest original source pixels creating a smooth but blurry look when overscaled
  linear,

  /// Nearest neighbor filtering interpolates pixel values using the nearest original source pixel creating a sharp but pixelated look when overscaled
  nearest,
}

extension RasterResamplingExtension on RasterResampling {
  Object toJson() {
    switch (this) {
      case RasterResampling.linear:
        return 'linear';
      case RasterResampling.nearest:
        return 'nearest';
    }
  }
}

RasterResampling? _parseFromJsonAsRasterResampling(
  DataContext context,
) {
  switch (context.value) {
    case 'linear':
      return RasterResampling.linear;
    case 'nearest':
      return RasterResampling.nearest;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Direction of light source when map is rotated.
enum HillshadeIlluminationAnchor {
  /// The hillshade illumination is relative to the north direction.
  map,

  /// The hillshade illumination is relative to the top of the viewport.
  viewport,
}

extension HillshadeIlluminationAnchorExtension on HillshadeIlluminationAnchor {
  Object toJson() {
    switch (this) {
      case HillshadeIlluminationAnchor.map:
        return 'map';
      case HillshadeIlluminationAnchor.viewport:
        return 'viewport';
    }
  }
}

HillshadeIlluminationAnchor? _parseFromJsonAsHillshadeIlluminationAnchor(
  DataContext context,
) {
  switch (context.value) {
    case 'map':
      return HillshadeIlluminationAnchor.map;
    case 'viewport':
      return HillshadeIlluminationAnchor.viewport;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// The type of the sky
enum SkyType {
  /// Renders the sky with a gradient that can be configured with `sky-gradient-radius` and `sky-gradient`.
  gradient,

  /// Renders the sky with a simulated atmospheric scattering algorithm, the sun direction can be attached to the light position or explicitly set through `sky-atmosphere-sun`.
  atmosphere,
}

extension SkyTypeExtension on SkyType {
  Object toJson() {
    switch (this) {
      case SkyType.gradient:
        return 'gradient';
      case SkyType.atmosphere:
        return 'atmosphere';
    }
  }
}

SkyType? _parseFromJsonAsSkyType(
  DataContext context,
) {
  switch (context.value) {
    case 'gradient':
      return SkyType.gradient;
    case 'atmosphere':
      return SkyType.atmosphere;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Rendering type of this layer.
enum LayerType {
  /// A filled polygon with an optional stroked border.
  fill,

  /// A stroked line.
  line,

  /// An icon or a text label.
  symbol,

  /// A filled circle.
  circle,

  /// A heatmap.
  heatmap,

  /// An extruded (3D) polygon.
  fillExtrusion,

  /// Raster map textures such as satellite imagery.
  raster,

  /// Client-side hillshading visualization based on DEM data. Currently, the implementation only supports Mapbox Terrain RGB and Mapzen Terrarium tiles.
  hillshade,

  /// The background color or pattern of the map.
  background,

  /// A spherical dome around the map that is always rendered behind all other layers.
  sky,
}

extension LayerTypeExtension on LayerType {
  Object toJson() {
    switch (this) {
      case LayerType.fill:
        return 'fill';
      case LayerType.line:
        return 'line';
      case LayerType.symbol:
        return 'symbol';
      case LayerType.circle:
        return 'circle';
      case LayerType.heatmap:
        return 'heatmap';
      case LayerType.fillExtrusion:
        return 'fill-extrusion';
      case LayerType.raster:
        return 'raster';
      case LayerType.hillshade:
        return 'hillshade';
      case LayerType.background:
        return 'background';
      case LayerType.sky:
        return 'sky';
    }
  }
}

LayerType? _parseFromJsonAsLayerType(
  DataContext context,
) {
  switch (context.value) {
    case 'fill':
      return LayerType.fill;
    case 'line':
      return LayerType.line;
    case 'symbol':
      return LayerType.symbol;
    case 'circle':
      return LayerType.circle;
    case 'heatmap':
      return LayerType.heatmap;
    case 'fill-extrusion':
      return LayerType.fillExtrusion;
    case 'raster':
      return LayerType.raster;
    case 'hillshade':
      return LayerType.hillshade;
    case 'background':
      return LayerType.background;
    case 'sky':
      return LayerType.sky;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

/// Style specification version number. Must be 8.
enum Version {
  eight,
}

extension VersionExtension on Version {
  Object toJson() {
    switch (this) {
      case Version.eight:
        return 8;
    }
  }
}

Version? _parseFromJsonAsVersion(
  DataContext context,
) {
  switch (context.value) {
    case 8:
      return Version.eight;
    default:
      context._recordException(DataException('Unknown enum value.'));
  }
}

abstract class Source with DataMixin {
  Source._({
    required SourceType type,
  }) : _type = type;

  SourceType get type => _type;
  final SourceType _type;

  @override
  Source copy();

  static Source? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final type = value['type'];
    switch (type) {
      case 'vector':
        return VectorSource.fromJson(context);
      case 'raster':
        return RasterSource.fromJson(context);
      case 'raster-dem':
        return RasterDemSource.fromJson(context);
      case 'geojson':
        return GeojsonSource.fromJson(context);
      case 'video':
        return VideoSource.fromJson(context);
      case 'image':
        return ImageSource.fromJson(context);
      default:
        context._recordException(
          DataException('Unable to parse value.'),
        );
        DataContext.child(parent: context, key: 'type', value: type)
            ._recordException(
          DataException('Unknown value for type discriminator'),
        );
    }
  }
}

abstract class LayoutProperties with DataMixin {
  LayoutProperties._();

  @override
  LayoutProperties copy();
}

abstract class PaintProperties with DataMixin {
  PaintProperties._();

  @override
  PaintProperties copy();
}

class Light with DataMixin {
  Light({
    Expression<LightAnchor>? anchor,
    Expression<Color>? color,
    Transition? colorTransition,
    Expression<num>? intensity,
    Transition? intensityTransition,
    Expression<List<num>>? position,
    Transition? positionTransition,
  })  : _anchor = anchor,
        _color = color,
        _colorTransition = colorTransition,
        _intensity = intensity,
        _intensityTransition = intensityTransition,
        _position = position,
        _positionTransition = positionTransition;

  Expression<LightAnchor>? get anchor => _anchor;
  Expression<LightAnchor>? _anchor;

  set anchor(Expression<LightAnchor>? value) {
    _checkNotFrozen();
    _anchor = value;
  }

  Expression<Color>? get color => _color;
  Expression<Color>? _color;

  set color(Expression<Color>? value) {
    _checkNotFrozen();
    _color = value;
  }

  Transition? get colorTransition => _colorTransition;
  Transition? _colorTransition;

  set colorTransition(Transition? value) {
    _checkNotFrozen();
    _colorTransition = value;
  }

  Expression<num>? get intensity => _intensity;
  Expression<num>? _intensity;

  set intensity(Expression<num>? value) {
    _checkNotFrozen();
    _intensity = value;
  }

  Transition? get intensityTransition => _intensityTransition;
  Transition? _intensityTransition;

  set intensityTransition(Transition? value) {
    _checkNotFrozen();
    _intensityTransition = value;
  }

  Expression<List<num>>? get position => _position;
  Expression<List<num>>? _position;

  set position(Expression<List<num>>? value) {
    _checkNotFrozen();
    _position = value;
  }

  Transition? get positionTransition => _positionTransition;
  Transition? _positionTransition;

  set positionTransition(Transition? value) {
    _checkNotFrozen();
    _positionTransition = value;
  }

  @override
  Light copy() => Light(
        anchor: _anchor,
        color: _color,
        colorTransition: () {
          final value = _colorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        intensity: _intensity,
        intensityTransition: () {
          final value = _intensityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        position: _position,
        positionTransition: () {
          final value = _positionTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
      );

  @override
  void freeze() {
    () {
      final value = _colorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _intensityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _positionTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_anchor != null) 'anchor': _anchor!.value,
        if (_color != null) 'color': _color!.value,
        if (_colorTransition != null)
          'color-transition': _colorTransition!.toJson(),
        if (_intensity != null) 'intensity': _intensity!.value,
        if (_intensityTransition != null)
          'intensity-transition': _intensityTransition!.toJson(),
        if (_position != null) 'position': _position!.value,
        if (_positionTransition != null)
          'position-transition': _positionTransition!.toJson(),
      };

  static Light? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = Light();
    if (map.containsKey('anchor')) {
      result._anchor = _parseDataProperty(
        context,
        'anchor',
        map.remove('anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('color')) {
      result._color = _parseDataProperty(
        context,
        'color',
        map.remove('color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('color-transition')) {
      result._colorTransition = _parseDataProperty(
        context,
        'color-transition',
        map.remove('color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('intensity')) {
      result._intensity = _parseDataProperty(
        context,
        'intensity',
        map.remove('intensity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('intensity-transition')) {
      result._intensityTransition = _parseDataProperty(
        context,
        'intensity-transition',
        map.remove('intensity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('position')) {
      result._position = _parseDataProperty(
        context,
        'position',
        map.remove('position'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('position-transition')) {
      result._positionTransition = _parseDataProperty(
        context,
        'position-transition',
        map.remove('position-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class Terrain with DataMixin {
  Terrain({
    Expression<num>? exaggeration,
    Transition? exaggerationTransition,
    String? source,
  })  : _exaggeration = exaggeration,
        _exaggerationTransition = exaggerationTransition,
        _source = source;

  Expression<num>? get exaggeration => _exaggeration;
  Expression<num>? _exaggeration;

  set exaggeration(Expression<num>? value) {
    _checkNotFrozen();
    _exaggeration = value;
  }

  Transition? get exaggerationTransition => _exaggerationTransition;
  Transition? _exaggerationTransition;

  set exaggerationTransition(Transition? value) {
    _checkNotFrozen();
    _exaggerationTransition = value;
  }

  String? get source => _source;
  String? _source;

  set source(String? value) {
    _checkNotFrozen();
    _source = value;
  }

  @override
  Terrain copy() => Terrain(
        exaggeration: _exaggeration,
        exaggerationTransition: () {
          final value = _exaggerationTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
      );

  @override
  void freeze() {
    () {
      final value = _exaggerationTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_exaggeration != null) 'exaggeration': _exaggeration!.value,
        if (_exaggerationTransition != null)
          'exaggeration-transition': _exaggerationTransition!.toJson(),
        if (_source != null) 'source': _source!,
      };

  static Terrain? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = Terrain();
    if (map.containsKey('exaggeration')) {
      result._exaggeration = _parseDataProperty(
        context,
        'exaggeration',
        map.remove('exaggeration'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('exaggeration-transition')) {
      result._exaggerationTransition = _parseDataProperty(
        context,
        'exaggeration-transition',
        map.remove('exaggeration-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class Fog with DataMixin {
  Fog({
    Expression<Color>? color,
    Transition? colorTransition,
    Expression<num>? horizonBlend,
    Transition? horizonBlendTransition,
    Expression<List<num>>? range,
    Transition? rangeTransition,
  })  : _color = color,
        _colorTransition = colorTransition,
        _horizonBlend = horizonBlend,
        _horizonBlendTransition = horizonBlendTransition,
        _range = range,
        _rangeTransition = rangeTransition;

  Expression<Color>? get color => _color;
  Expression<Color>? _color;

  set color(Expression<Color>? value) {
    _checkNotFrozen();
    _color = value;
  }

  Transition? get colorTransition => _colorTransition;
  Transition? _colorTransition;

  set colorTransition(Transition? value) {
    _checkNotFrozen();
    _colorTransition = value;
  }

  Expression<num>? get horizonBlend => _horizonBlend;
  Expression<num>? _horizonBlend;

  set horizonBlend(Expression<num>? value) {
    _checkNotFrozen();
    _horizonBlend = value;
  }

  Transition? get horizonBlendTransition => _horizonBlendTransition;
  Transition? _horizonBlendTransition;

  set horizonBlendTransition(Transition? value) {
    _checkNotFrozen();
    _horizonBlendTransition = value;
  }

  Expression<List<num>>? get range => _range;
  Expression<List<num>>? _range;

  set range(Expression<List<num>>? value) {
    _checkNotFrozen();
    _range = value;
  }

  Transition? get rangeTransition => _rangeTransition;
  Transition? _rangeTransition;

  set rangeTransition(Transition? value) {
    _checkNotFrozen();
    _rangeTransition = value;
  }

  @override
  Fog copy() => Fog(
        color: _color,
        colorTransition: () {
          final value = _colorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        horizonBlend: _horizonBlend,
        horizonBlendTransition: () {
          final value = _horizonBlendTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        range: _range,
        rangeTransition: () {
          final value = _rangeTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
      );

  @override
  void freeze() {
    () {
      final value = _colorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _horizonBlendTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _rangeTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_color != null) 'color': _color!.value,
        if (_colorTransition != null)
          'color-transition': _colorTransition!.toJson(),
        if (_horizonBlend != null) 'horizon-blend': _horizonBlend!.value,
        if (_horizonBlendTransition != null)
          'horizon-blend-transition': _horizonBlendTransition!.toJson(),
        if (_range != null) 'range': _range!.value,
        if (_rangeTransition != null)
          'range-transition': _rangeTransition!.toJson(),
      };

  static Fog? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = Fog();
    if (map.containsKey('color')) {
      result._color = _parseDataProperty(
        context,
        'color',
        map.remove('color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('color-transition')) {
      result._colorTransition = _parseDataProperty(
        context,
        'color-transition',
        map.remove('color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('horizon-blend')) {
      result._horizonBlend = _parseDataProperty(
        context,
        'horizon-blend',
        map.remove('horizon-blend'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('horizon-blend-transition')) {
      result._horizonBlendTransition = _parseDataProperty(
        context,
        'horizon-blend-transition',
        map.remove('horizon-blend-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('range')) {
      result._range = _parseDataProperty(
        context,
        'range',
        map.remove('range'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('range-transition')) {
      result._rangeTransition = _parseDataProperty(
        context,
        'range-transition',
        map.remove('range-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class VectorSource extends Source with MapMixin<String, Object?> {
  VectorSource({
    String? attribution,
    List<num>? bounds,
    num? maxzoom,
    num? minzoom,
    PromoteId? promoteId,
    TileScheme? scheme,
    List<String>? tiles,
    String? url,
    bool? volatile,
    Map<String, Object?>? other,
  })  : _attribution = attribution,
        _bounds = bounds,
        _maxzoom = maxzoom,
        _minzoom = minzoom,
        _promoteId = promoteId,
        _scheme = scheme,
        _tiles = tiles,
        _url = url,
        _volatile = volatile,
        super._(
          type: SourceType.vector,
        ) {
    if (other != null) {
      _dynamicProperties.addAll(other);
    }
  }

  String? get attribution => _attribution;
  String? _attribution;

  set attribution(String? value) {
    _checkNotFrozen();
    _attribution = value;
  }

  List<num>? get bounds => _bounds;
  List<num>? _bounds;

  set bounds(List<num>? value) {
    _checkNotFrozen();
    _bounds = value;
  }

  num? get maxzoom => _maxzoom;
  num? _maxzoom;

  set maxzoom(num? value) {
    _checkNotFrozen();
    _maxzoom = value;
  }

  num? get minzoom => _minzoom;
  num? _minzoom;

  set minzoom(num? value) {
    _checkNotFrozen();
    _minzoom = value;
  }

  PromoteId? get promoteId => _promoteId;
  PromoteId? _promoteId;

  set promoteId(PromoteId? value) {
    _checkNotFrozen();
    _promoteId = value;
  }

  TileScheme? get scheme => _scheme;
  TileScheme? _scheme;

  set scheme(TileScheme? value) {
    _checkNotFrozen();
    _scheme = value;
  }

  List<String>? get tiles => _tiles;
  List<String>? _tiles;

  set tiles(List<String>? value) {
    _checkNotFrozen();
    _tiles = value;
  }

  String? get url => _url;
  String? _url;

  set url(String? value) {
    _checkNotFrozen();
    _url = value;
  }

  bool? get volatile => _volatile;
  bool? _volatile;

  set volatile(bool? value) {
    _checkNotFrozen();
    _volatile = value;
  }

  @override
  Iterable<String> get keys => _dynamicProperties.keys;

  @override
  Object? operator [](Object? key) => _dynamicProperties[key];

  @override
  void operator []=(String key, Object? value) {
    _checkNotFrozen();
    _dynamicProperties[key] = value;
  }

  @override
  Object? remove(Object? key) {
    _checkNotFrozen();
    _dynamicProperties.remove(key);
  }

  @override
  void clear() {
    _checkNotFrozen();
    _dynamicProperties.clear();
  }

  final Map<String, Object?> _dynamicProperties = {};

  @override
  VectorSource copy() => VectorSource(
        attribution: _attribution,
        bounds: () {
          final value = _bounds;
          if (value != null) {
            return List<num>.of(value);
          }
        }(),
        maxzoom: _maxzoom,
        minzoom: _minzoom,
        promoteId: _promoteId,
        scheme: _scheme,
        tiles: () {
          final value = _tiles;
          if (value != null) {
            return List<String>.of(value);
          }
        }(),
        url: _url,
        volatile: _volatile,
        other: <String, Object?>{
          for (final entry in _dynamicProperties.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: false);
              }
            }(),
        },
      );

  @override
  void freeze() {
    _bounds = () {
      final value = _bounds;
      if (value != null) {
        return List<num>.unmodifiable(value);
      }
    }();
    _tiles = () {
      final value = _tiles;
      if (value != null) {
        return List<String>.unmodifiable(value);
      }
    }();
    for (final entry in _dynamicProperties.entries) {
      _dynamicProperties[entry.key] = () {
        final value = entry.value;
        if (value != null) {
          return _copyJson(value, immutable: true);
        }
      }();
    }
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_attribution != null) 'attribution': _attribution!,
        if (_bounds != null) 'bounds': _bounds!,
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_promoteId != null) 'promoteId': _promoteId!.toJson(),
        if (_scheme != null) 'scheme': _scheme!.toJson(),
        if (_tiles != null) 'tiles': _tiles!,
        'type': _type.toJson(),
        if (_url != null) 'url': _url!,
        if (_volatile != null) 'volatile': _volatile!,
        for (final entry in _dynamicProperties.entries)
          entry.key: () {
            final value = entry.value;
            if (value != null) {
              return value;
            }
          }(),
      };

  static VectorSource? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = VectorSource();
    if (map.containsKey('attribution')) {
      result._attribution = _parseDataProperty(
        context,
        'attribution',
        map.remove('attribution'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('bounds')) {
      result._bounds = _parseDataProperty(
        context,
        'bounds',
        map.remove('bounds'),
        (context) => _parseArray<num>(
          context,
          (context) => _parseAsType<num>(context),
        ),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('promoteId')) {
      result._promoteId = _parseDataProperty(
        context,
        'promoteId',
        map.remove('promoteId'),
        (context) => PromoteId.fromJson(context),
      );
    }
    if (map.containsKey('scheme')) {
      result._scheme = _parseDataProperty(
        context,
        'scheme',
        map.remove('scheme'),
        (context) => _parseFromJsonAsTileScheme(context),
      );
    }
    if (map.containsKey('tiles')) {
      result._tiles = _parseDataProperty(
        context,
        'tiles',
        map.remove('tiles'),
        (context) => _parseArray<String>(
          context,
          (context) => _parseAsType<String>(context),
        ),
      );
    }
    const typeKey = 'type';
    const expectedType = 'vector';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.containsKey('url')) {
      result._url = _parseDataProperty(
        context,
        'url',
        map.remove('url'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('volatile')) {
      result._volatile = _parseDataProperty(
        context,
        'volatile',
        map.remove('volatile'),
        (context) => _parseAsType<bool>(context),
      );
    }
    _parseDynamicProperties(
      context,
      map,
      result._dynamicProperties,
      (context) => context.value == null ? null : _parseAsType<Object>(context),
    );
    return result;
  }
}

class RasterSource extends Source with MapMixin<String, Object?> {
  RasterSource({
    String? attribution,
    List<num>? bounds,
    num? maxzoom,
    num? minzoom,
    TileScheme? scheme,
    num? tileSize,
    List<String>? tiles,
    String? url,
    bool? volatile,
    Map<String, Object?>? other,
  })  : _attribution = attribution,
        _bounds = bounds,
        _maxzoom = maxzoom,
        _minzoom = minzoom,
        _scheme = scheme,
        _tileSize = tileSize,
        _tiles = tiles,
        _url = url,
        _volatile = volatile,
        super._(
          type: SourceType.raster,
        ) {
    if (other != null) {
      _dynamicProperties.addAll(other);
    }
  }

  String? get attribution => _attribution;
  String? _attribution;

  set attribution(String? value) {
    _checkNotFrozen();
    _attribution = value;
  }

  List<num>? get bounds => _bounds;
  List<num>? _bounds;

  set bounds(List<num>? value) {
    _checkNotFrozen();
    _bounds = value;
  }

  num? get maxzoom => _maxzoom;
  num? _maxzoom;

  set maxzoom(num? value) {
    _checkNotFrozen();
    _maxzoom = value;
  }

  num? get minzoom => _minzoom;
  num? _minzoom;

  set minzoom(num? value) {
    _checkNotFrozen();
    _minzoom = value;
  }

  TileScheme? get scheme => _scheme;
  TileScheme? _scheme;

  set scheme(TileScheme? value) {
    _checkNotFrozen();
    _scheme = value;
  }

  num? get tileSize => _tileSize;
  num? _tileSize;

  set tileSize(num? value) {
    _checkNotFrozen();
    _tileSize = value;
  }

  List<String>? get tiles => _tiles;
  List<String>? _tiles;

  set tiles(List<String>? value) {
    _checkNotFrozen();
    _tiles = value;
  }

  String? get url => _url;
  String? _url;

  set url(String? value) {
    _checkNotFrozen();
    _url = value;
  }

  bool? get volatile => _volatile;
  bool? _volatile;

  set volatile(bool? value) {
    _checkNotFrozen();
    _volatile = value;
  }

  @override
  Iterable<String> get keys => _dynamicProperties.keys;

  @override
  Object? operator [](Object? key) => _dynamicProperties[key];

  @override
  void operator []=(String key, Object? value) {
    _checkNotFrozen();
    _dynamicProperties[key] = value;
  }

  @override
  Object? remove(Object? key) {
    _checkNotFrozen();
    _dynamicProperties.remove(key);
  }

  @override
  void clear() {
    _checkNotFrozen();
    _dynamicProperties.clear();
  }

  final Map<String, Object?> _dynamicProperties = {};

  @override
  RasterSource copy() => RasterSource(
        attribution: _attribution,
        bounds: () {
          final value = _bounds;
          if (value != null) {
            return List<num>.of(value);
          }
        }(),
        maxzoom: _maxzoom,
        minzoom: _minzoom,
        scheme: _scheme,
        tileSize: _tileSize,
        tiles: () {
          final value = _tiles;
          if (value != null) {
            return List<String>.of(value);
          }
        }(),
        url: _url,
        volatile: _volatile,
        other: <String, Object?>{
          for (final entry in _dynamicProperties.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: false);
              }
            }(),
        },
      );

  @override
  void freeze() {
    _bounds = () {
      final value = _bounds;
      if (value != null) {
        return List<num>.unmodifiable(value);
      }
    }();
    _tiles = () {
      final value = _tiles;
      if (value != null) {
        return List<String>.unmodifiable(value);
      }
    }();
    for (final entry in _dynamicProperties.entries) {
      _dynamicProperties[entry.key] = () {
        final value = entry.value;
        if (value != null) {
          return _copyJson(value, immutable: true);
        }
      }();
    }
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_attribution != null) 'attribution': _attribution!,
        if (_bounds != null) 'bounds': _bounds!,
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_scheme != null) 'scheme': _scheme!.toJson(),
        if (_tileSize != null) 'tileSize': _tileSize!,
        if (_tiles != null) 'tiles': _tiles!,
        'type': _type.toJson(),
        if (_url != null) 'url': _url!,
        if (_volatile != null) 'volatile': _volatile!,
        for (final entry in _dynamicProperties.entries)
          entry.key: () {
            final value = entry.value;
            if (value != null) {
              return value;
            }
          }(),
      };

  static RasterSource? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = RasterSource();
    if (map.containsKey('attribution')) {
      result._attribution = _parseDataProperty(
        context,
        'attribution',
        map.remove('attribution'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('bounds')) {
      result._bounds = _parseDataProperty(
        context,
        'bounds',
        map.remove('bounds'),
        (context) => _parseArray<num>(
          context,
          (context) => _parseAsType<num>(context),
        ),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('scheme')) {
      result._scheme = _parseDataProperty(
        context,
        'scheme',
        map.remove('scheme'),
        (context) => _parseFromJsonAsTileScheme(context),
      );
    }
    if (map.containsKey('tileSize')) {
      result._tileSize = _parseDataProperty(
        context,
        'tileSize',
        map.remove('tileSize'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('tiles')) {
      result._tiles = _parseDataProperty(
        context,
        'tiles',
        map.remove('tiles'),
        (context) => _parseArray<String>(
          context,
          (context) => _parseAsType<String>(context),
        ),
      );
    }
    const typeKey = 'type';
    const expectedType = 'raster';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.containsKey('url')) {
      result._url = _parseDataProperty(
        context,
        'url',
        map.remove('url'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('volatile')) {
      result._volatile = _parseDataProperty(
        context,
        'volatile',
        map.remove('volatile'),
        (context) => _parseAsType<bool>(context),
      );
    }
    _parseDynamicProperties(
      context,
      map,
      result._dynamicProperties,
      (context) => context.value == null ? null : _parseAsType<Object>(context),
    );
    return result;
  }
}

class RasterDemSource extends Source with MapMixin<String, Object?> {
  RasterDemSource({
    String? attribution,
    List<num>? bounds,
    DemEncoding? encoding,
    num? maxzoom,
    num? minzoom,
    num? tileSize,
    List<String>? tiles,
    String? url,
    bool? volatile,
    Map<String, Object?>? other,
  })  : _attribution = attribution,
        _bounds = bounds,
        _encoding = encoding,
        _maxzoom = maxzoom,
        _minzoom = minzoom,
        _tileSize = tileSize,
        _tiles = tiles,
        _url = url,
        _volatile = volatile,
        super._(
          type: SourceType.rasterDem,
        ) {
    if (other != null) {
      _dynamicProperties.addAll(other);
    }
  }

  String? get attribution => _attribution;
  String? _attribution;

  set attribution(String? value) {
    _checkNotFrozen();
    _attribution = value;
  }

  List<num>? get bounds => _bounds;
  List<num>? _bounds;

  set bounds(List<num>? value) {
    _checkNotFrozen();
    _bounds = value;
  }

  DemEncoding? get encoding => _encoding;
  DemEncoding? _encoding;

  set encoding(DemEncoding? value) {
    _checkNotFrozen();
    _encoding = value;
  }

  num? get maxzoom => _maxzoom;
  num? _maxzoom;

  set maxzoom(num? value) {
    _checkNotFrozen();
    _maxzoom = value;
  }

  num? get minzoom => _minzoom;
  num? _minzoom;

  set minzoom(num? value) {
    _checkNotFrozen();
    _minzoom = value;
  }

  num? get tileSize => _tileSize;
  num? _tileSize;

  set tileSize(num? value) {
    _checkNotFrozen();
    _tileSize = value;
  }

  List<String>? get tiles => _tiles;
  List<String>? _tiles;

  set tiles(List<String>? value) {
    _checkNotFrozen();
    _tiles = value;
  }

  String? get url => _url;
  String? _url;

  set url(String? value) {
    _checkNotFrozen();
    _url = value;
  }

  bool? get volatile => _volatile;
  bool? _volatile;

  set volatile(bool? value) {
    _checkNotFrozen();
    _volatile = value;
  }

  @override
  Iterable<String> get keys => _dynamicProperties.keys;

  @override
  Object? operator [](Object? key) => _dynamicProperties[key];

  @override
  void operator []=(String key, Object? value) {
    _checkNotFrozen();
    _dynamicProperties[key] = value;
  }

  @override
  Object? remove(Object? key) {
    _checkNotFrozen();
    _dynamicProperties.remove(key);
  }

  @override
  void clear() {
    _checkNotFrozen();
    _dynamicProperties.clear();
  }

  final Map<String, Object?> _dynamicProperties = {};

  @override
  RasterDemSource copy() => RasterDemSource(
        attribution: _attribution,
        bounds: () {
          final value = _bounds;
          if (value != null) {
            return List<num>.of(value);
          }
        }(),
        encoding: _encoding,
        maxzoom: _maxzoom,
        minzoom: _minzoom,
        tileSize: _tileSize,
        tiles: () {
          final value = _tiles;
          if (value != null) {
            return List<String>.of(value);
          }
        }(),
        url: _url,
        volatile: _volatile,
        other: <String, Object?>{
          for (final entry in _dynamicProperties.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: false);
              }
            }(),
        },
      );

  @override
  void freeze() {
    _bounds = () {
      final value = _bounds;
      if (value != null) {
        return List<num>.unmodifiable(value);
      }
    }();
    _tiles = () {
      final value = _tiles;
      if (value != null) {
        return List<String>.unmodifiable(value);
      }
    }();
    for (final entry in _dynamicProperties.entries) {
      _dynamicProperties[entry.key] = () {
        final value = entry.value;
        if (value != null) {
          return _copyJson(value, immutable: true);
        }
      }();
    }
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_attribution != null) 'attribution': _attribution!,
        if (_bounds != null) 'bounds': _bounds!,
        if (_encoding != null) 'encoding': _encoding!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_tileSize != null) 'tileSize': _tileSize!,
        if (_tiles != null) 'tiles': _tiles!,
        'type': _type.toJson(),
        if (_url != null) 'url': _url!,
        if (_volatile != null) 'volatile': _volatile!,
        for (final entry in _dynamicProperties.entries)
          entry.key: () {
            final value = entry.value;
            if (value != null) {
              return value;
            }
          }(),
      };

  static RasterDemSource? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = RasterDemSource();
    if (map.containsKey('attribution')) {
      result._attribution = _parseDataProperty(
        context,
        'attribution',
        map.remove('attribution'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('bounds')) {
      result._bounds = _parseDataProperty(
        context,
        'bounds',
        map.remove('bounds'),
        (context) => _parseArray<num>(
          context,
          (context) => _parseAsType<num>(context),
        ),
      );
    }
    if (map.containsKey('encoding')) {
      result._encoding = _parseDataProperty(
        context,
        'encoding',
        map.remove('encoding'),
        (context) => _parseFromJsonAsDemEncoding(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('tileSize')) {
      result._tileSize = _parseDataProperty(
        context,
        'tileSize',
        map.remove('tileSize'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('tiles')) {
      result._tiles = _parseDataProperty(
        context,
        'tiles',
        map.remove('tiles'),
        (context) => _parseArray<String>(
          context,
          (context) => _parseAsType<String>(context),
        ),
      );
    }
    const typeKey = 'type';
    const expectedType = 'rasterDem';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.containsKey('url')) {
      result._url = _parseDataProperty(
        context,
        'url',
        map.remove('url'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('volatile')) {
      result._volatile = _parseDataProperty(
        context,
        'volatile',
        map.remove('volatile'),
        (context) => _parseAsType<bool>(context),
      );
    }
    _parseDynamicProperties(
      context,
      map,
      result._dynamicProperties,
      (context) => context.value == null ? null : _parseAsType<Object>(context),
    );
    return result;
  }
}

class GeojsonSource extends Source {
  GeojsonSource({
    String? attribution,
    num? buffer,
    bool? cluster,
    num? clusterMaxZoom,
    num? clusterMinPoints,
    Object? clusterProperties,
    num? clusterRadius,
    Object? data,
    Expression<bool>? filter,
    bool? generateId,
    bool? lineMetrics,
    num? maxzoom,
    PromoteId? promoteId,
    num? tolerance,
  })  : _attribution = attribution,
        _buffer = buffer,
        _cluster = cluster,
        _clusterMaxZoom = clusterMaxZoom,
        _clusterMinPoints = clusterMinPoints,
        _clusterProperties = clusterProperties,
        _clusterRadius = clusterRadius,
        _data = data,
        _filter = filter,
        _generateId = generateId,
        _lineMetrics = lineMetrics,
        _maxzoom = maxzoom,
        _promoteId = promoteId,
        _tolerance = tolerance,
        super._(
          type: SourceType.geojson,
        );

  String? get attribution => _attribution;
  String? _attribution;

  set attribution(String? value) {
    _checkNotFrozen();
    _attribution = value;
  }

  num? get buffer => _buffer;
  num? _buffer;

  set buffer(num? value) {
    _checkNotFrozen();
    _buffer = value;
  }

  bool? get cluster => _cluster;
  bool? _cluster;

  set cluster(bool? value) {
    _checkNotFrozen();
    _cluster = value;
  }

  num? get clusterMaxZoom => _clusterMaxZoom;
  num? _clusterMaxZoom;

  set clusterMaxZoom(num? value) {
    _checkNotFrozen();
    _clusterMaxZoom = value;
  }

  num? get clusterMinPoints => _clusterMinPoints;
  num? _clusterMinPoints;

  set clusterMinPoints(num? value) {
    _checkNotFrozen();
    _clusterMinPoints = value;
  }

  Object? get clusterProperties => _clusterProperties;
  Object? _clusterProperties;

  set clusterProperties(Object? value) {
    _checkNotFrozen();
    _clusterProperties = value;
  }

  num? get clusterRadius => _clusterRadius;
  num? _clusterRadius;

  set clusterRadius(num? value) {
    _checkNotFrozen();
    _clusterRadius = value;
  }

  Object? get data => _data;
  Object? _data;

  set data(Object? value) {
    _checkNotFrozen();
    _data = value;
  }

  Expression<bool>? get filter => _filter;
  Expression<bool>? _filter;

  set filter(Expression<bool>? value) {
    _checkNotFrozen();
    _filter = value;
  }

  bool? get generateId => _generateId;
  bool? _generateId;

  set generateId(bool? value) {
    _checkNotFrozen();
    _generateId = value;
  }

  bool? get lineMetrics => _lineMetrics;
  bool? _lineMetrics;

  set lineMetrics(bool? value) {
    _checkNotFrozen();
    _lineMetrics = value;
  }

  num? get maxzoom => _maxzoom;
  num? _maxzoom;

  set maxzoom(num? value) {
    _checkNotFrozen();
    _maxzoom = value;
  }

  PromoteId? get promoteId => _promoteId;
  PromoteId? _promoteId;

  set promoteId(PromoteId? value) {
    _checkNotFrozen();
    _promoteId = value;
  }

  num? get tolerance => _tolerance;
  num? _tolerance;

  set tolerance(num? value) {
    _checkNotFrozen();
    _tolerance = value;
  }

  @override
  GeojsonSource copy() => GeojsonSource(
        attribution: _attribution,
        buffer: _buffer,
        cluster: _cluster,
        clusterMaxZoom: _clusterMaxZoom,
        clusterMinPoints: _clusterMinPoints,
        clusterProperties: () {
          final value = _clusterProperties;
          if (value != null) {
            return _copyJson(value, immutable: false);
          }
        }(),
        clusterRadius: _clusterRadius,
        data: () {
          final value = _data;
          if (value != null) {
            return _copyJson(value, immutable: false);
          }
        }(),
        filter: _filter,
        generateId: _generateId,
        lineMetrics: _lineMetrics,
        maxzoom: _maxzoom,
        promoteId: _promoteId,
        tolerance: _tolerance,
      );

  @override
  void freeze() {
    _clusterProperties = () {
      final value = _clusterProperties;
      if (value != null) {
        return _copyJson(value, immutable: true);
      }
    }();
    _data = () {
      final value = _data;
      if (value != null) {
        return _copyJson(value, immutable: true);
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_attribution != null) 'attribution': _attribution!,
        if (_buffer != null) 'buffer': _buffer!,
        if (_cluster != null) 'cluster': _cluster!,
        if (_clusterMaxZoom != null) 'clusterMaxZoom': _clusterMaxZoom!,
        if (_clusterMinPoints != null) 'clusterMinPoints': _clusterMinPoints!,
        if (_clusterProperties != null)
          'clusterProperties': _clusterProperties!,
        if (_clusterRadius != null) 'clusterRadius': _clusterRadius!,
        if (_data != null) 'data': _data!,
        if (_filter != null) 'filter': _filter!.value,
        if (_generateId != null) 'generateId': _generateId!,
        if (_lineMetrics != null) 'lineMetrics': _lineMetrics!,
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_promoteId != null) 'promoteId': _promoteId!.toJson(),
        if (_tolerance != null) 'tolerance': _tolerance!,
        'type': _type.toJson(),
      };

  static GeojsonSource? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = GeojsonSource();
    if (map.containsKey('attribution')) {
      result._attribution = _parseDataProperty(
        context,
        'attribution',
        map.remove('attribution'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('buffer')) {
      result._buffer = _parseDataProperty(
        context,
        'buffer',
        map.remove('buffer'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('cluster')) {
      result._cluster = _parseDataProperty(
        context,
        'cluster',
        map.remove('cluster'),
        (context) => _parseAsType<bool>(context),
      );
    }
    if (map.containsKey('clusterMaxZoom')) {
      result._clusterMaxZoom = _parseDataProperty(
        context,
        'clusterMaxZoom',
        map.remove('clusterMaxZoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('clusterMinPoints')) {
      result._clusterMinPoints = _parseDataProperty(
        context,
        'clusterMinPoints',
        map.remove('clusterMinPoints'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('clusterProperties')) {
      result._clusterProperties = _parseDataProperty(
        context,
        'clusterProperties',
        map.remove('clusterProperties'),
        (context) =>
            context.value == null ? null : _parseAsType<Object>(context),
      );
    }
    if (map.containsKey('clusterRadius')) {
      result._clusterRadius = _parseDataProperty(
        context,
        'clusterRadius',
        map.remove('clusterRadius'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('data')) {
      result._data = _parseDataProperty(
        context,
        'data',
        map.remove('data'),
        (context) =>
            context.value == null ? null : _parseAsType<Object>(context),
      );
    }
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('generateId')) {
      result._generateId = _parseDataProperty(
        context,
        'generateId',
        map.remove('generateId'),
        (context) => _parseAsType<bool>(context),
      );
    }
    if (map.containsKey('lineMetrics')) {
      result._lineMetrics = _parseDataProperty(
        context,
        'lineMetrics',
        map.remove('lineMetrics'),
        (context) => _parseAsType<bool>(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('promoteId')) {
      result._promoteId = _parseDataProperty(
        context,
        'promoteId',
        map.remove('promoteId'),
        (context) => PromoteId.fromJson(context),
      );
    }
    if (map.containsKey('tolerance')) {
      result._tolerance = _parseDataProperty(
        context,
        'tolerance',
        map.remove('tolerance'),
        (context) => _parseAsType<num>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'geojson';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class VideoSource extends Source {
  VideoSource({
    List<List<num>>? coordinates,
    List<String>? urls,
  })  : _coordinates = coordinates,
        _urls = urls,
        super._(
          type: SourceType.video,
        );

  List<List<num>>? get coordinates => _coordinates;
  List<List<num>>? _coordinates;

  set coordinates(List<List<num>>? value) {
    _checkNotFrozen();
    _coordinates = value;
  }

  List<String>? get urls => _urls;
  List<String>? _urls;

  set urls(List<String>? value) {
    _checkNotFrozen();
    _urls = value;
  }

  @override
  VideoSource copy() => VideoSource(
        coordinates: () {
          final value = _coordinates;
          if (value != null) {
            return <List<num>>[
              for (final element in value) List<num>.of(element),
            ];
          }
        }(),
        urls: () {
          final value = _urls;
          if (value != null) {
            return List<String>.of(value);
          }
        }(),
      );

  @override
  void freeze() {
    _coordinates = () {
      final value = _coordinates;
      if (value != null) {
        return <List<num>>[
          for (final element in value) List<num>.unmodifiable(element),
        ];
      }
    }();
    _urls = () {
      final value = _urls;
      if (value != null) {
        return List<String>.unmodifiable(value);
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_coordinates != null)
          'coordinates': <Object?>[
            for (final element in _coordinates!) element,
          ],
        'type': _type.toJson(),
        if (_urls != null) 'urls': _urls!,
      };

  static VideoSource? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = VideoSource();
    if (map.containsKey('coordinates')) {
      result._coordinates = _parseDataProperty(
        context,
        'coordinates',
        map.remove('coordinates'),
        (context) => _parseArray<List<num>>(
          context,
          (context) => _parseArray<num>(
            context,
            (context) => _parseAsType<num>(context),
          ),
        ),
      );
    }
    const typeKey = 'type';
    const expectedType = 'video';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.containsKey('urls')) {
      result._urls = _parseDataProperty(
        context,
        'urls',
        map.remove('urls'),
        (context) => _parseArray<String>(
          context,
          (context) => _parseAsType<String>(context),
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class ImageSource extends Source {
  ImageSource({
    List<List<num>>? coordinates,
    String? url,
  })  : _coordinates = coordinates,
        _url = url,
        super._(
          type: SourceType.image,
        );

  List<List<num>>? get coordinates => _coordinates;
  List<List<num>>? _coordinates;

  set coordinates(List<List<num>>? value) {
    _checkNotFrozen();
    _coordinates = value;
  }

  String? get url => _url;
  String? _url;

  set url(String? value) {
    _checkNotFrozen();
    _url = value;
  }

  @override
  ImageSource copy() => ImageSource(
        coordinates: () {
          final value = _coordinates;
          if (value != null) {
            return <List<num>>[
              for (final element in value) List<num>.of(element),
            ];
          }
        }(),
        url: _url,
      );

  @override
  void freeze() {
    _coordinates = () {
      final value = _coordinates;
      if (value != null) {
        return <List<num>>[
          for (final element in value) List<num>.unmodifiable(element),
        ];
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_coordinates != null)
          'coordinates': <Object?>[
            for (final element in _coordinates!) element,
          ],
        'type': _type.toJson(),
        if (_url != null) 'url': _url!,
      };

  static ImageSource? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = ImageSource();
    if (map.containsKey('coordinates')) {
      result._coordinates = _parseDataProperty(
        context,
        'coordinates',
        map.remove('coordinates'),
        (context) => _parseArray<List<num>>(
          context,
          (context) => _parseArray<num>(
            context,
            (context) => _parseAsType<num>(context),
          ),
        ),
      );
    }
    const typeKey = 'type';
    const expectedType = 'image';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.containsKey('url')) {
      result._url = _parseDataProperty(
        context,
        'url',
        map.remove('url'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class Sources with DataMixin, MapMixin<String, Source> {
  Sources([
    Map<String, Source>? values,
  ]) {
    if (values != null) {
      _dynamicProperties.addAll(values);
    }
  }

  @override
  Iterable<String> get keys => _dynamicProperties.keys;

  @override
  Source? operator [](Object? key) => _dynamicProperties[key];

  @override
  void operator []=(String key, Source value) {
    _checkNotFrozen();
    _dynamicProperties[key] = value;
  }

  @override
  Source? remove(Object? key) {
    _checkNotFrozen();
    _dynamicProperties.remove(key);
  }

  @override
  void clear() {
    _checkNotFrozen();
    _dynamicProperties.clear();
  }

  final Map<String, Source> _dynamicProperties = {};

  @override
  Sources copy() => Sources(
        <String, Source>{
          for (final entry in _dynamicProperties.entries)
            entry.key: entry.value.copy(),
        },
      );

  @override
  void freeze() {
    for (final entry in _dynamicProperties.entries) {
      entry.value.freeze();
    }
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        for (final entry in _dynamicProperties.entries)
          entry.key: entry.value.toJson(),
      };

  static Sources? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = Sources();
    _parseDynamicProperties(
      context,
      map,
      result._dynamicProperties,
      (context) => Source.fromJson(context),
    );
    return result;
  }
}

class Transition with DataMixin {
  Transition({
    num? delay,
    num? duration,
  })  : _delay = delay,
        _duration = duration;

  num? get delay => _delay;
  num? _delay;

  set delay(num? value) {
    _checkNotFrozen();
    _delay = value;
  }

  num? get duration => _duration;
  num? _duration;

  set duration(num? value) {
    _checkNotFrozen();
    _duration = value;
  }

  @override
  Transition copy() => Transition(
        delay: _delay,
        duration: _duration,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_delay != null) 'delay': _delay!,
        if (_duration != null) 'duration': _duration!,
      };

  static Transition? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = Transition();
    if (map.containsKey('delay')) {
      result._delay = _parseDataProperty(
        context,
        'delay',
        map.remove('delay'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('duration')) {
      result._duration = _parseDataProperty(
        context,
        'duration',
        map.remove('duration'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class Projection with DataMixin {
  Projection({
    List<num>? center,
    ProjectionName? name,
    List<num>? parallels,
  })  : _center = center,
        _name = name,
        _parallels = parallels;

  List<num>? get center => _center;
  List<num>? _center;

  set center(List<num>? value) {
    _checkNotFrozen();
    _center = value;
  }

  ProjectionName? get name => _name;
  ProjectionName? _name;

  set name(ProjectionName? value) {
    _checkNotFrozen();
    _name = value;
  }

  List<num>? get parallels => _parallels;
  List<num>? _parallels;

  set parallels(List<num>? value) {
    _checkNotFrozen();
    _parallels = value;
  }

  @override
  Projection copy() => Projection(
        center: () {
          final value = _center;
          if (value != null) {
            return List<num>.of(value);
          }
        }(),
        name: _name,
        parallels: () {
          final value = _parallels;
          if (value != null) {
            return List<num>.of(value);
          }
        }(),
      );

  @override
  void freeze() {
    _center = () {
      final value = _center;
      if (value != null) {
        return List<num>.unmodifiable(value);
      }
    }();
    _parallels = () {
      final value = _parallels;
      if (value != null) {
        return List<num>.unmodifiable(value);
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_center != null) 'center': _center!,
        if (_name != null) 'name': _name!.toJson(),
        if (_parallels != null) 'parallels': _parallels!,
      };

  static Projection? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = Projection();
    if (map.containsKey('center')) {
      result._center = _parseDataProperty(
        context,
        'center',
        map.remove('center'),
        (context) => _parseArray<num>(
          context,
          (context) => _parseAsType<num>(context),
        ),
      );
    }
    if (map.containsKey('name')) {
      result._name = _parseDataProperty(
        context,
        'name',
        map.remove('name'),
        (context) => _parseFromJsonAsProjectionName(context),
      );
    }
    if (map.containsKey('parallels')) {
      result._parallels = _parseDataProperty(
        context,
        'parallels',
        map.remove('parallels'),
        (context) => _parseArray<num>(
          context,
          (context) => _parseAsType<num>(context),
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class FillLayout extends LayoutProperties {
  FillLayout({
    Expression<num>? fillSortKey,
    LayerVisibility? visibility,
  })  : _fillSortKey = fillSortKey,
        _visibility = visibility,
        super._();

  Expression<num>? get fillSortKey => _fillSortKey;
  Expression<num>? _fillSortKey;

  set fillSortKey(Expression<num>? value) {
    _checkNotFrozen();
    _fillSortKey = value;
  }

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  FillLayout copy() => FillLayout(
        fillSortKey: _fillSortKey,
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_fillSortKey != null) 'fill-sort-key': _fillSortKey!.value,
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static FillLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = FillLayout();
    if (map.containsKey('fill-sort-key')) {
      result._fillSortKey = _parseDataProperty(
        context,
        'fill-sort-key',
        map.remove('fill-sort-key'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class LineLayout extends LayoutProperties {
  LineLayout({
    Expression<LineCap>? lineCap,
    Expression<LineJoin>? lineJoin,
    Expression<num>? lineMiterLimit,
    Expression<num>? lineRoundLimit,
    Expression<num>? lineSortKey,
    LayerVisibility? visibility,
  })  : _lineCap = lineCap,
        _lineJoin = lineJoin,
        _lineMiterLimit = lineMiterLimit,
        _lineRoundLimit = lineRoundLimit,
        _lineSortKey = lineSortKey,
        _visibility = visibility,
        super._();

  Expression<LineCap>? get lineCap => _lineCap;
  Expression<LineCap>? _lineCap;

  set lineCap(Expression<LineCap>? value) {
    _checkNotFrozen();
    _lineCap = value;
  }

  Expression<LineJoin>? get lineJoin => _lineJoin;
  Expression<LineJoin>? _lineJoin;

  set lineJoin(Expression<LineJoin>? value) {
    _checkNotFrozen();
    _lineJoin = value;
  }

  Expression<num>? get lineMiterLimit => _lineMiterLimit;
  Expression<num>? _lineMiterLimit;

  set lineMiterLimit(Expression<num>? value) {
    _checkNotFrozen();
    _lineMiterLimit = value;
  }

  Expression<num>? get lineRoundLimit => _lineRoundLimit;
  Expression<num>? _lineRoundLimit;

  set lineRoundLimit(Expression<num>? value) {
    _checkNotFrozen();
    _lineRoundLimit = value;
  }

  Expression<num>? get lineSortKey => _lineSortKey;
  Expression<num>? _lineSortKey;

  set lineSortKey(Expression<num>? value) {
    _checkNotFrozen();
    _lineSortKey = value;
  }

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  LineLayout copy() => LineLayout(
        lineCap: _lineCap,
        lineJoin: _lineJoin,
        lineMiterLimit: _lineMiterLimit,
        lineRoundLimit: _lineRoundLimit,
        lineSortKey: _lineSortKey,
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_lineCap != null) 'line-cap': _lineCap!.value,
        if (_lineJoin != null) 'line-join': _lineJoin!.value,
        if (_lineMiterLimit != null) 'line-miter-limit': _lineMiterLimit!.value,
        if (_lineRoundLimit != null) 'line-round-limit': _lineRoundLimit!.value,
        if (_lineSortKey != null) 'line-sort-key': _lineSortKey!.value,
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static LineLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = LineLayout();
    if (map.containsKey('line-cap')) {
      result._lineCap = _parseDataProperty(
        context,
        'line-cap',
        map.remove('line-cap'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-join')) {
      result._lineJoin = _parseDataProperty(
        context,
        'line-join',
        map.remove('line-join'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-miter-limit')) {
      result._lineMiterLimit = _parseDataProperty(
        context,
        'line-miter-limit',
        map.remove('line-miter-limit'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-round-limit')) {
      result._lineRoundLimit = _parseDataProperty(
        context,
        'line-round-limit',
        map.remove('line-round-limit'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-sort-key')) {
      result._lineSortKey = _parseDataProperty(
        context,
        'line-sort-key',
        map.remove('line-sort-key'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class CircleLayout extends LayoutProperties {
  CircleLayout({
    Expression<num>? circleSortKey,
    LayerVisibility? visibility,
  })  : _circleSortKey = circleSortKey,
        _visibility = visibility,
        super._();

  Expression<num>? get circleSortKey => _circleSortKey;
  Expression<num>? _circleSortKey;

  set circleSortKey(Expression<num>? value) {
    _checkNotFrozen();
    _circleSortKey = value;
  }

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  CircleLayout copy() => CircleLayout(
        circleSortKey: _circleSortKey,
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_circleSortKey != null) 'circle-sort-key': _circleSortKey!.value,
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static CircleLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = CircleLayout();
    if (map.containsKey('circle-sort-key')) {
      result._circleSortKey = _parseDataProperty(
        context,
        'circle-sort-key',
        map.remove('circle-sort-key'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class HeatmapLayout extends LayoutProperties {
  HeatmapLayout({
    LayerVisibility? visibility,
  })  : _visibility = visibility,
        super._();

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  HeatmapLayout copy() => HeatmapLayout(
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static HeatmapLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = HeatmapLayout();
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class FillExtrusionLayout extends LayoutProperties {
  FillExtrusionLayout({
    LayerVisibility? visibility,
  })  : _visibility = visibility,
        super._();

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  FillExtrusionLayout copy() => FillExtrusionLayout(
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static FillExtrusionLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = FillExtrusionLayout();
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class SymbolLayout extends LayoutProperties {
  SymbolLayout({
    Expression<bool>? iconAllowOverlap,
    Expression<IconAnchor>? iconAnchor,
    Expression<bool>? iconIgnorePlacement,
    Expression<ResolvedImage>? iconImage,
    Expression<bool>? iconKeepUpright,
    Expression<List<num>>? iconOffset,
    Expression<bool>? iconOptional,
    Expression<num>? iconPadding,
    Expression<IconPitchAlignment>? iconPitchAlignment,
    Expression<num>? iconRotate,
    Expression<IconRotationAlignment>? iconRotationAlignment,
    Expression<num>? iconSize,
    Expression<IconTextFit>? iconTextFit,
    Expression<List<num>>? iconTextFitPadding,
    Expression<bool>? symbolAvoidEdges,
    Expression<SymbolPlacement>? symbolPlacement,
    Expression<num>? symbolSortKey,
    Expression<num>? symbolSpacing,
    Expression<SymbolZOrder>? symbolZOrder,
    Expression<bool>? textAllowOverlap,
    Expression<TextAnchor>? textAnchor,
    Expression<Formatted>? textField,
    Expression<List<String>>? textFont,
    Expression<bool>? textIgnorePlacement,
    Expression<TextJustify>? textJustify,
    Expression<bool>? textKeepUpright,
    Expression<num>? textLetterSpacing,
    Expression<num>? textLineHeight,
    Expression<num>? textMaxAngle,
    Expression<num>? textMaxWidth,
    Expression<List<num>>? textOffset,
    Expression<bool>? textOptional,
    Expression<num>? textPadding,
    Expression<TextPitchAlignment>? textPitchAlignment,
    Expression<num>? textRadialOffset,
    Expression<num>? textRotate,
    Expression<TextRotationAlignment>? textRotationAlignment,
    Expression<num>? textSize,
    Expression<TextTransform>? textTransform,
    Expression<List<TextVariableAnchor>>? textVariableAnchor,
    Expression<List<TextWritingMode>>? textWritingMode,
    LayerVisibility? visibility,
  })  : _iconAllowOverlap = iconAllowOverlap,
        _iconAnchor = iconAnchor,
        _iconIgnorePlacement = iconIgnorePlacement,
        _iconImage = iconImage,
        _iconKeepUpright = iconKeepUpright,
        _iconOffset = iconOffset,
        _iconOptional = iconOptional,
        _iconPadding = iconPadding,
        _iconPitchAlignment = iconPitchAlignment,
        _iconRotate = iconRotate,
        _iconRotationAlignment = iconRotationAlignment,
        _iconSize = iconSize,
        _iconTextFit = iconTextFit,
        _iconTextFitPadding = iconTextFitPadding,
        _symbolAvoidEdges = symbolAvoidEdges,
        _symbolPlacement = symbolPlacement,
        _symbolSortKey = symbolSortKey,
        _symbolSpacing = symbolSpacing,
        _symbolZOrder = symbolZOrder,
        _textAllowOverlap = textAllowOverlap,
        _textAnchor = textAnchor,
        _textField = textField,
        _textFont = textFont,
        _textIgnorePlacement = textIgnorePlacement,
        _textJustify = textJustify,
        _textKeepUpright = textKeepUpright,
        _textLetterSpacing = textLetterSpacing,
        _textLineHeight = textLineHeight,
        _textMaxAngle = textMaxAngle,
        _textMaxWidth = textMaxWidth,
        _textOffset = textOffset,
        _textOptional = textOptional,
        _textPadding = textPadding,
        _textPitchAlignment = textPitchAlignment,
        _textRadialOffset = textRadialOffset,
        _textRotate = textRotate,
        _textRotationAlignment = textRotationAlignment,
        _textSize = textSize,
        _textTransform = textTransform,
        _textVariableAnchor = textVariableAnchor,
        _textWritingMode = textWritingMode,
        _visibility = visibility,
        super._();

  Expression<bool>? get iconAllowOverlap => _iconAllowOverlap;
  Expression<bool>? _iconAllowOverlap;

  set iconAllowOverlap(Expression<bool>? value) {
    _checkNotFrozen();
    _iconAllowOverlap = value;
  }

  Expression<IconAnchor>? get iconAnchor => _iconAnchor;
  Expression<IconAnchor>? _iconAnchor;

  set iconAnchor(Expression<IconAnchor>? value) {
    _checkNotFrozen();
    _iconAnchor = value;
  }

  Expression<bool>? get iconIgnorePlacement => _iconIgnorePlacement;
  Expression<bool>? _iconIgnorePlacement;

  set iconIgnorePlacement(Expression<bool>? value) {
    _checkNotFrozen();
    _iconIgnorePlacement = value;
  }

  Expression<ResolvedImage>? get iconImage => _iconImage;
  Expression<ResolvedImage>? _iconImage;

  set iconImage(Expression<ResolvedImage>? value) {
    _checkNotFrozen();
    _iconImage = value;
  }

  Expression<bool>? get iconKeepUpright => _iconKeepUpright;
  Expression<bool>? _iconKeepUpright;

  set iconKeepUpright(Expression<bool>? value) {
    _checkNotFrozen();
    _iconKeepUpright = value;
  }

  Expression<List<num>>? get iconOffset => _iconOffset;
  Expression<List<num>>? _iconOffset;

  set iconOffset(Expression<List<num>>? value) {
    _checkNotFrozen();
    _iconOffset = value;
  }

  Expression<bool>? get iconOptional => _iconOptional;
  Expression<bool>? _iconOptional;

  set iconOptional(Expression<bool>? value) {
    _checkNotFrozen();
    _iconOptional = value;
  }

  Expression<num>? get iconPadding => _iconPadding;
  Expression<num>? _iconPadding;

  set iconPadding(Expression<num>? value) {
    _checkNotFrozen();
    _iconPadding = value;
  }

  Expression<IconPitchAlignment>? get iconPitchAlignment => _iconPitchAlignment;
  Expression<IconPitchAlignment>? _iconPitchAlignment;

  set iconPitchAlignment(Expression<IconPitchAlignment>? value) {
    _checkNotFrozen();
    _iconPitchAlignment = value;
  }

  Expression<num>? get iconRotate => _iconRotate;
  Expression<num>? _iconRotate;

  set iconRotate(Expression<num>? value) {
    _checkNotFrozen();
    _iconRotate = value;
  }

  Expression<IconRotationAlignment>? get iconRotationAlignment =>
      _iconRotationAlignment;
  Expression<IconRotationAlignment>? _iconRotationAlignment;

  set iconRotationAlignment(Expression<IconRotationAlignment>? value) {
    _checkNotFrozen();
    _iconRotationAlignment = value;
  }

  Expression<num>? get iconSize => _iconSize;
  Expression<num>? _iconSize;

  set iconSize(Expression<num>? value) {
    _checkNotFrozen();
    _iconSize = value;
  }

  Expression<IconTextFit>? get iconTextFit => _iconTextFit;
  Expression<IconTextFit>? _iconTextFit;

  set iconTextFit(Expression<IconTextFit>? value) {
    _checkNotFrozen();
    _iconTextFit = value;
  }

  Expression<List<num>>? get iconTextFitPadding => _iconTextFitPadding;
  Expression<List<num>>? _iconTextFitPadding;

  set iconTextFitPadding(Expression<List<num>>? value) {
    _checkNotFrozen();
    _iconTextFitPadding = value;
  }

  Expression<bool>? get symbolAvoidEdges => _symbolAvoidEdges;
  Expression<bool>? _symbolAvoidEdges;

  set symbolAvoidEdges(Expression<bool>? value) {
    _checkNotFrozen();
    _symbolAvoidEdges = value;
  }

  Expression<SymbolPlacement>? get symbolPlacement => _symbolPlacement;
  Expression<SymbolPlacement>? _symbolPlacement;

  set symbolPlacement(Expression<SymbolPlacement>? value) {
    _checkNotFrozen();
    _symbolPlacement = value;
  }

  Expression<num>? get symbolSortKey => _symbolSortKey;
  Expression<num>? _symbolSortKey;

  set symbolSortKey(Expression<num>? value) {
    _checkNotFrozen();
    _symbolSortKey = value;
  }

  Expression<num>? get symbolSpacing => _symbolSpacing;
  Expression<num>? _symbolSpacing;

  set symbolSpacing(Expression<num>? value) {
    _checkNotFrozen();
    _symbolSpacing = value;
  }

  Expression<SymbolZOrder>? get symbolZOrder => _symbolZOrder;
  Expression<SymbolZOrder>? _symbolZOrder;

  set symbolZOrder(Expression<SymbolZOrder>? value) {
    _checkNotFrozen();
    _symbolZOrder = value;
  }

  Expression<bool>? get textAllowOverlap => _textAllowOverlap;
  Expression<bool>? _textAllowOverlap;

  set textAllowOverlap(Expression<bool>? value) {
    _checkNotFrozen();
    _textAllowOverlap = value;
  }

  Expression<TextAnchor>? get textAnchor => _textAnchor;
  Expression<TextAnchor>? _textAnchor;

  set textAnchor(Expression<TextAnchor>? value) {
    _checkNotFrozen();
    _textAnchor = value;
  }

  Expression<Formatted>? get textField => _textField;
  Expression<Formatted>? _textField;

  set textField(Expression<Formatted>? value) {
    _checkNotFrozen();
    _textField = value;
  }

  Expression<List<String>>? get textFont => _textFont;
  Expression<List<String>>? _textFont;

  set textFont(Expression<List<String>>? value) {
    _checkNotFrozen();
    _textFont = value;
  }

  Expression<bool>? get textIgnorePlacement => _textIgnorePlacement;
  Expression<bool>? _textIgnorePlacement;

  set textIgnorePlacement(Expression<bool>? value) {
    _checkNotFrozen();
    _textIgnorePlacement = value;
  }

  Expression<TextJustify>? get textJustify => _textJustify;
  Expression<TextJustify>? _textJustify;

  set textJustify(Expression<TextJustify>? value) {
    _checkNotFrozen();
    _textJustify = value;
  }

  Expression<bool>? get textKeepUpright => _textKeepUpright;
  Expression<bool>? _textKeepUpright;

  set textKeepUpright(Expression<bool>? value) {
    _checkNotFrozen();
    _textKeepUpright = value;
  }

  Expression<num>? get textLetterSpacing => _textLetterSpacing;
  Expression<num>? _textLetterSpacing;

  set textLetterSpacing(Expression<num>? value) {
    _checkNotFrozen();
    _textLetterSpacing = value;
  }

  Expression<num>? get textLineHeight => _textLineHeight;
  Expression<num>? _textLineHeight;

  set textLineHeight(Expression<num>? value) {
    _checkNotFrozen();
    _textLineHeight = value;
  }

  Expression<num>? get textMaxAngle => _textMaxAngle;
  Expression<num>? _textMaxAngle;

  set textMaxAngle(Expression<num>? value) {
    _checkNotFrozen();
    _textMaxAngle = value;
  }

  Expression<num>? get textMaxWidth => _textMaxWidth;
  Expression<num>? _textMaxWidth;

  set textMaxWidth(Expression<num>? value) {
    _checkNotFrozen();
    _textMaxWidth = value;
  }

  Expression<List<num>>? get textOffset => _textOffset;
  Expression<List<num>>? _textOffset;

  set textOffset(Expression<List<num>>? value) {
    _checkNotFrozen();
    _textOffset = value;
  }

  Expression<bool>? get textOptional => _textOptional;
  Expression<bool>? _textOptional;

  set textOptional(Expression<bool>? value) {
    _checkNotFrozen();
    _textOptional = value;
  }

  Expression<num>? get textPadding => _textPadding;
  Expression<num>? _textPadding;

  set textPadding(Expression<num>? value) {
    _checkNotFrozen();
    _textPadding = value;
  }

  Expression<TextPitchAlignment>? get textPitchAlignment => _textPitchAlignment;
  Expression<TextPitchAlignment>? _textPitchAlignment;

  set textPitchAlignment(Expression<TextPitchAlignment>? value) {
    _checkNotFrozen();
    _textPitchAlignment = value;
  }

  Expression<num>? get textRadialOffset => _textRadialOffset;
  Expression<num>? _textRadialOffset;

  set textRadialOffset(Expression<num>? value) {
    _checkNotFrozen();
    _textRadialOffset = value;
  }

  Expression<num>? get textRotate => _textRotate;
  Expression<num>? _textRotate;

  set textRotate(Expression<num>? value) {
    _checkNotFrozen();
    _textRotate = value;
  }

  Expression<TextRotationAlignment>? get textRotationAlignment =>
      _textRotationAlignment;
  Expression<TextRotationAlignment>? _textRotationAlignment;

  set textRotationAlignment(Expression<TextRotationAlignment>? value) {
    _checkNotFrozen();
    _textRotationAlignment = value;
  }

  Expression<num>? get textSize => _textSize;
  Expression<num>? _textSize;

  set textSize(Expression<num>? value) {
    _checkNotFrozen();
    _textSize = value;
  }

  Expression<TextTransform>? get textTransform => _textTransform;
  Expression<TextTransform>? _textTransform;

  set textTransform(Expression<TextTransform>? value) {
    _checkNotFrozen();
    _textTransform = value;
  }

  Expression<List<TextVariableAnchor>>? get textVariableAnchor =>
      _textVariableAnchor;
  Expression<List<TextVariableAnchor>>? _textVariableAnchor;

  set textVariableAnchor(Expression<List<TextVariableAnchor>>? value) {
    _checkNotFrozen();
    _textVariableAnchor = value;
  }

  Expression<List<TextWritingMode>>? get textWritingMode => _textWritingMode;
  Expression<List<TextWritingMode>>? _textWritingMode;

  set textWritingMode(Expression<List<TextWritingMode>>? value) {
    _checkNotFrozen();
    _textWritingMode = value;
  }

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  SymbolLayout copy() => SymbolLayout(
        iconAllowOverlap: _iconAllowOverlap,
        iconAnchor: _iconAnchor,
        iconIgnorePlacement: _iconIgnorePlacement,
        iconImage: _iconImage,
        iconKeepUpright: _iconKeepUpright,
        iconOffset: _iconOffset,
        iconOptional: _iconOptional,
        iconPadding: _iconPadding,
        iconPitchAlignment: _iconPitchAlignment,
        iconRotate: _iconRotate,
        iconRotationAlignment: _iconRotationAlignment,
        iconSize: _iconSize,
        iconTextFit: _iconTextFit,
        iconTextFitPadding: _iconTextFitPadding,
        symbolAvoidEdges: _symbolAvoidEdges,
        symbolPlacement: _symbolPlacement,
        symbolSortKey: _symbolSortKey,
        symbolSpacing: _symbolSpacing,
        symbolZOrder: _symbolZOrder,
        textAllowOverlap: _textAllowOverlap,
        textAnchor: _textAnchor,
        textField: _textField,
        textFont: _textFont,
        textIgnorePlacement: _textIgnorePlacement,
        textJustify: _textJustify,
        textKeepUpright: _textKeepUpright,
        textLetterSpacing: _textLetterSpacing,
        textLineHeight: _textLineHeight,
        textMaxAngle: _textMaxAngle,
        textMaxWidth: _textMaxWidth,
        textOffset: _textOffset,
        textOptional: _textOptional,
        textPadding: _textPadding,
        textPitchAlignment: _textPitchAlignment,
        textRadialOffset: _textRadialOffset,
        textRotate: _textRotate,
        textRotationAlignment: _textRotationAlignment,
        textSize: _textSize,
        textTransform: _textTransform,
        textVariableAnchor: _textVariableAnchor,
        textWritingMode: _textWritingMode,
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_iconAllowOverlap != null)
          'icon-allow-overlap': _iconAllowOverlap!.value,
        if (_iconAnchor != null) 'icon-anchor': _iconAnchor!.value,
        if (_iconIgnorePlacement != null)
          'icon-ignore-placement': _iconIgnorePlacement!.value,
        if (_iconImage != null) 'icon-image': _iconImage!.value,
        if (_iconKeepUpright != null)
          'icon-keep-upright': _iconKeepUpright!.value,
        if (_iconOffset != null) 'icon-offset': _iconOffset!.value,
        if (_iconOptional != null) 'icon-optional': _iconOptional!.value,
        if (_iconPadding != null) 'icon-padding': _iconPadding!.value,
        if (_iconPitchAlignment != null)
          'icon-pitch-alignment': _iconPitchAlignment!.value,
        if (_iconRotate != null) 'icon-rotate': _iconRotate!.value,
        if (_iconRotationAlignment != null)
          'icon-rotation-alignment': _iconRotationAlignment!.value,
        if (_iconSize != null) 'icon-size': _iconSize!.value,
        if (_iconTextFit != null) 'icon-text-fit': _iconTextFit!.value,
        if (_iconTextFitPadding != null)
          'icon-text-fit-padding': _iconTextFitPadding!.value,
        if (_symbolAvoidEdges != null)
          'symbol-avoid-edges': _symbolAvoidEdges!.value,
        if (_symbolPlacement != null)
          'symbol-placement': _symbolPlacement!.value,
        if (_symbolSortKey != null) 'symbol-sort-key': _symbolSortKey!.value,
        if (_symbolSpacing != null) 'symbol-spacing': _symbolSpacing!.value,
        if (_symbolZOrder != null) 'symbol-z-order': _symbolZOrder!.value,
        if (_textAllowOverlap != null)
          'text-allow-overlap': _textAllowOverlap!.value,
        if (_textAnchor != null) 'text-anchor': _textAnchor!.value,
        if (_textField != null) 'text-field': _textField!.value,
        if (_textFont != null) 'text-font': _textFont!.value,
        if (_textIgnorePlacement != null)
          'text-ignore-placement': _textIgnorePlacement!.value,
        if (_textJustify != null) 'text-justify': _textJustify!.value,
        if (_textKeepUpright != null)
          'text-keep-upright': _textKeepUpright!.value,
        if (_textLetterSpacing != null)
          'text-letter-spacing': _textLetterSpacing!.value,
        if (_textLineHeight != null) 'text-line-height': _textLineHeight!.value,
        if (_textMaxAngle != null) 'text-max-angle': _textMaxAngle!.value,
        if (_textMaxWidth != null) 'text-max-width': _textMaxWidth!.value,
        if (_textOffset != null) 'text-offset': _textOffset!.value,
        if (_textOptional != null) 'text-optional': _textOptional!.value,
        if (_textPadding != null) 'text-padding': _textPadding!.value,
        if (_textPitchAlignment != null)
          'text-pitch-alignment': _textPitchAlignment!.value,
        if (_textRadialOffset != null)
          'text-radial-offset': _textRadialOffset!.value,
        if (_textRotate != null) 'text-rotate': _textRotate!.value,
        if (_textRotationAlignment != null)
          'text-rotation-alignment': _textRotationAlignment!.value,
        if (_textSize != null) 'text-size': _textSize!.value,
        if (_textTransform != null) 'text-transform': _textTransform!.value,
        if (_textVariableAnchor != null)
          'text-variable-anchor': _textVariableAnchor!.value,
        if (_textWritingMode != null)
          'text-writing-mode': _textWritingMode!.value,
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static SymbolLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = SymbolLayout();
    if (map.containsKey('icon-allow-overlap')) {
      result._iconAllowOverlap = _parseDataProperty(
        context,
        'icon-allow-overlap',
        map.remove('icon-allow-overlap'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-anchor')) {
      result._iconAnchor = _parseDataProperty(
        context,
        'icon-anchor',
        map.remove('icon-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-ignore-placement')) {
      result._iconIgnorePlacement = _parseDataProperty(
        context,
        'icon-ignore-placement',
        map.remove('icon-ignore-placement'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-image')) {
      result._iconImage = _parseDataProperty(
        context,
        'icon-image',
        map.remove('icon-image'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-keep-upright')) {
      result._iconKeepUpright = _parseDataProperty(
        context,
        'icon-keep-upright',
        map.remove('icon-keep-upright'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-offset')) {
      result._iconOffset = _parseDataProperty(
        context,
        'icon-offset',
        map.remove('icon-offset'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-optional')) {
      result._iconOptional = _parseDataProperty(
        context,
        'icon-optional',
        map.remove('icon-optional'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-padding')) {
      result._iconPadding = _parseDataProperty(
        context,
        'icon-padding',
        map.remove('icon-padding'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-pitch-alignment')) {
      result._iconPitchAlignment = _parseDataProperty(
        context,
        'icon-pitch-alignment',
        map.remove('icon-pitch-alignment'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-rotate')) {
      result._iconRotate = _parseDataProperty(
        context,
        'icon-rotate',
        map.remove('icon-rotate'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-rotation-alignment')) {
      result._iconRotationAlignment = _parseDataProperty(
        context,
        'icon-rotation-alignment',
        map.remove('icon-rotation-alignment'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-size')) {
      result._iconSize = _parseDataProperty(
        context,
        'icon-size',
        map.remove('icon-size'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-text-fit')) {
      result._iconTextFit = _parseDataProperty(
        context,
        'icon-text-fit',
        map.remove('icon-text-fit'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-text-fit-padding')) {
      result._iconTextFitPadding = _parseDataProperty(
        context,
        'icon-text-fit-padding',
        map.remove('icon-text-fit-padding'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('symbol-avoid-edges')) {
      result._symbolAvoidEdges = _parseDataProperty(
        context,
        'symbol-avoid-edges',
        map.remove('symbol-avoid-edges'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('symbol-placement')) {
      result._symbolPlacement = _parseDataProperty(
        context,
        'symbol-placement',
        map.remove('symbol-placement'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('symbol-sort-key')) {
      result._symbolSortKey = _parseDataProperty(
        context,
        'symbol-sort-key',
        map.remove('symbol-sort-key'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('symbol-spacing')) {
      result._symbolSpacing = _parseDataProperty(
        context,
        'symbol-spacing',
        map.remove('symbol-spacing'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('symbol-z-order')) {
      result._symbolZOrder = _parseDataProperty(
        context,
        'symbol-z-order',
        map.remove('symbol-z-order'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-allow-overlap')) {
      result._textAllowOverlap = _parseDataProperty(
        context,
        'text-allow-overlap',
        map.remove('text-allow-overlap'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-anchor')) {
      result._textAnchor = _parseDataProperty(
        context,
        'text-anchor',
        map.remove('text-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-field')) {
      result._textField = _parseDataProperty(
        context,
        'text-field',
        map.remove('text-field'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-font')) {
      result._textFont = _parseDataProperty(
        context,
        'text-font',
        map.remove('text-font'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-ignore-placement')) {
      result._textIgnorePlacement = _parseDataProperty(
        context,
        'text-ignore-placement',
        map.remove('text-ignore-placement'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-justify')) {
      result._textJustify = _parseDataProperty(
        context,
        'text-justify',
        map.remove('text-justify'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-keep-upright')) {
      result._textKeepUpright = _parseDataProperty(
        context,
        'text-keep-upright',
        map.remove('text-keep-upright'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-letter-spacing')) {
      result._textLetterSpacing = _parseDataProperty(
        context,
        'text-letter-spacing',
        map.remove('text-letter-spacing'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-line-height')) {
      result._textLineHeight = _parseDataProperty(
        context,
        'text-line-height',
        map.remove('text-line-height'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-max-angle')) {
      result._textMaxAngle = _parseDataProperty(
        context,
        'text-max-angle',
        map.remove('text-max-angle'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-max-width')) {
      result._textMaxWidth = _parseDataProperty(
        context,
        'text-max-width',
        map.remove('text-max-width'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-offset')) {
      result._textOffset = _parseDataProperty(
        context,
        'text-offset',
        map.remove('text-offset'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-optional')) {
      result._textOptional = _parseDataProperty(
        context,
        'text-optional',
        map.remove('text-optional'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-padding')) {
      result._textPadding = _parseDataProperty(
        context,
        'text-padding',
        map.remove('text-padding'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-pitch-alignment')) {
      result._textPitchAlignment = _parseDataProperty(
        context,
        'text-pitch-alignment',
        map.remove('text-pitch-alignment'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-radial-offset')) {
      result._textRadialOffset = _parseDataProperty(
        context,
        'text-radial-offset',
        map.remove('text-radial-offset'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-rotate')) {
      result._textRotate = _parseDataProperty(
        context,
        'text-rotate',
        map.remove('text-rotate'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-rotation-alignment')) {
      result._textRotationAlignment = _parseDataProperty(
        context,
        'text-rotation-alignment',
        map.remove('text-rotation-alignment'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-size')) {
      result._textSize = _parseDataProperty(
        context,
        'text-size',
        map.remove('text-size'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-transform')) {
      result._textTransform = _parseDataProperty(
        context,
        'text-transform',
        map.remove('text-transform'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-variable-anchor')) {
      result._textVariableAnchor = _parseDataProperty(
        context,
        'text-variable-anchor',
        map.remove('text-variable-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-writing-mode')) {
      result._textWritingMode = _parseDataProperty(
        context,
        'text-writing-mode',
        map.remove('text-writing-mode'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class RasterLayout extends LayoutProperties {
  RasterLayout({
    LayerVisibility? visibility,
  })  : _visibility = visibility,
        super._();

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  RasterLayout copy() => RasterLayout(
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static RasterLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = RasterLayout();
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class HillshadeLayout extends LayoutProperties {
  HillshadeLayout({
    LayerVisibility? visibility,
  })  : _visibility = visibility,
        super._();

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  HillshadeLayout copy() => HillshadeLayout(
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static HillshadeLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = HillshadeLayout();
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class BackgroundLayout extends LayoutProperties {
  BackgroundLayout({
    LayerVisibility? visibility,
  })  : _visibility = visibility,
        super._();

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  BackgroundLayout copy() => BackgroundLayout(
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static BackgroundLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = BackgroundLayout();
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class SkyLayout extends LayoutProperties {
  SkyLayout({
    LayerVisibility? visibility,
  })  : _visibility = visibility,
        super._();

  LayerVisibility? get visibility => _visibility;
  LayerVisibility? _visibility;

  set visibility(LayerVisibility? value) {
    _checkNotFrozen();
    _visibility = value;
  }

  @override
  SkyLayout copy() => SkyLayout(
        visibility: _visibility,
      );

  @override
  Map<String, Object?> toJson() => {
        if (_visibility != null) 'visibility': _visibility!.toJson(),
      };

  static SkyLayout? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = SkyLayout();
    if (map.containsKey('visibility')) {
      result._visibility = _parseDataProperty(
        context,
        'visibility',
        map.remove('visibility'),
        (context) => _parseFromJsonAsLayerVisibility(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class FillPaint extends PaintProperties {
  FillPaint({
    Expression<bool>? fillAntialias,
    Expression<Color>? fillColor,
    Transition? fillColorTransition,
    Expression<num>? fillOpacity,
    Transition? fillOpacityTransition,
    Expression<Color>? fillOutlineColor,
    Transition? fillOutlineColorTransition,
    Expression<ResolvedImage>? fillPattern,
    Transition? fillPatternTransition,
    Expression<List<num>>? fillTranslate,
    Expression<FillTranslateAnchor>? fillTranslateAnchor,
    Transition? fillTranslateTransition,
  })  : _fillAntialias = fillAntialias,
        _fillColor = fillColor,
        _fillColorTransition = fillColorTransition,
        _fillOpacity = fillOpacity,
        _fillOpacityTransition = fillOpacityTransition,
        _fillOutlineColor = fillOutlineColor,
        _fillOutlineColorTransition = fillOutlineColorTransition,
        _fillPattern = fillPattern,
        _fillPatternTransition = fillPatternTransition,
        _fillTranslate = fillTranslate,
        _fillTranslateAnchor = fillTranslateAnchor,
        _fillTranslateTransition = fillTranslateTransition,
        super._();

  Expression<bool>? get fillAntialias => _fillAntialias;
  Expression<bool>? _fillAntialias;

  set fillAntialias(Expression<bool>? value) {
    _checkNotFrozen();
    _fillAntialias = value;
  }

  Expression<Color>? get fillColor => _fillColor;
  Expression<Color>? _fillColor;

  set fillColor(Expression<Color>? value) {
    _checkNotFrozen();
    _fillColor = value;
  }

  Transition? get fillColorTransition => _fillColorTransition;
  Transition? _fillColorTransition;

  set fillColorTransition(Transition? value) {
    _checkNotFrozen();
    _fillColorTransition = value;
  }

  Expression<num>? get fillOpacity => _fillOpacity;
  Expression<num>? _fillOpacity;

  set fillOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _fillOpacity = value;
  }

  Transition? get fillOpacityTransition => _fillOpacityTransition;
  Transition? _fillOpacityTransition;

  set fillOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _fillOpacityTransition = value;
  }

  Expression<Color>? get fillOutlineColor => _fillOutlineColor;
  Expression<Color>? _fillOutlineColor;

  set fillOutlineColor(Expression<Color>? value) {
    _checkNotFrozen();
    _fillOutlineColor = value;
  }

  Transition? get fillOutlineColorTransition => _fillOutlineColorTransition;
  Transition? _fillOutlineColorTransition;

  set fillOutlineColorTransition(Transition? value) {
    _checkNotFrozen();
    _fillOutlineColorTransition = value;
  }

  Expression<ResolvedImage>? get fillPattern => _fillPattern;
  Expression<ResolvedImage>? _fillPattern;

  set fillPattern(Expression<ResolvedImage>? value) {
    _checkNotFrozen();
    _fillPattern = value;
  }

  Transition? get fillPatternTransition => _fillPatternTransition;
  Transition? _fillPatternTransition;

  set fillPatternTransition(Transition? value) {
    _checkNotFrozen();
    _fillPatternTransition = value;
  }

  Expression<List<num>>? get fillTranslate => _fillTranslate;
  Expression<List<num>>? _fillTranslate;

  set fillTranslate(Expression<List<num>>? value) {
    _checkNotFrozen();
    _fillTranslate = value;
  }

  Expression<FillTranslateAnchor>? get fillTranslateAnchor =>
      _fillTranslateAnchor;
  Expression<FillTranslateAnchor>? _fillTranslateAnchor;

  set fillTranslateAnchor(Expression<FillTranslateAnchor>? value) {
    _checkNotFrozen();
    _fillTranslateAnchor = value;
  }

  Transition? get fillTranslateTransition => _fillTranslateTransition;
  Transition? _fillTranslateTransition;

  set fillTranslateTransition(Transition? value) {
    _checkNotFrozen();
    _fillTranslateTransition = value;
  }

  @override
  FillPaint copy() => FillPaint(
        fillAntialias: _fillAntialias,
        fillColor: _fillColor,
        fillColorTransition: () {
          final value = _fillColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillOpacity: _fillOpacity,
        fillOpacityTransition: () {
          final value = _fillOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillOutlineColor: _fillOutlineColor,
        fillOutlineColorTransition: () {
          final value = _fillOutlineColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillPattern: _fillPattern,
        fillPatternTransition: () {
          final value = _fillPatternTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillTranslate: _fillTranslate,
        fillTranslateAnchor: _fillTranslateAnchor,
        fillTranslateTransition: () {
          final value = _fillTranslateTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
      );

  @override
  void freeze() {
    () {
      final value = _fillColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _fillOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _fillOutlineColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _fillPatternTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _fillTranslateTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_fillAntialias != null) 'fill-antialias': _fillAntialias!.value,
        if (_fillColor != null) 'fill-color': _fillColor!.value,
        if (_fillColorTransition != null)
          'fill-color-transition': _fillColorTransition!.toJson(),
        if (_fillOpacity != null) 'fill-opacity': _fillOpacity!.value,
        if (_fillOpacityTransition != null)
          'fill-opacity-transition': _fillOpacityTransition!.toJson(),
        if (_fillOutlineColor != null)
          'fill-outline-color': _fillOutlineColor!.value,
        if (_fillOutlineColorTransition != null)
          'fill-outline-color-transition':
              _fillOutlineColorTransition!.toJson(),
        if (_fillPattern != null) 'fill-pattern': _fillPattern!.value,
        if (_fillPatternTransition != null)
          'fill-pattern-transition': _fillPatternTransition!.toJson(),
        if (_fillTranslate != null) 'fill-translate': _fillTranslate!.value,
        if (_fillTranslateAnchor != null)
          'fill-translate-anchor': _fillTranslateAnchor!.value,
        if (_fillTranslateTransition != null)
          'fill-translate-transition': _fillTranslateTransition!.toJson(),
      };

  static FillPaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = FillPaint();
    if (map.containsKey('fill-antialias')) {
      result._fillAntialias = _parseDataProperty(
        context,
        'fill-antialias',
        map.remove('fill-antialias'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-color')) {
      result._fillColor = _parseDataProperty(
        context,
        'fill-color',
        map.remove('fill-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-color-transition')) {
      result._fillColorTransition = _parseDataProperty(
        context,
        'fill-color-transition',
        map.remove('fill-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-opacity')) {
      result._fillOpacity = _parseDataProperty(
        context,
        'fill-opacity',
        map.remove('fill-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-opacity-transition')) {
      result._fillOpacityTransition = _parseDataProperty(
        context,
        'fill-opacity-transition',
        map.remove('fill-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-outline-color')) {
      result._fillOutlineColor = _parseDataProperty(
        context,
        'fill-outline-color',
        map.remove('fill-outline-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-outline-color-transition')) {
      result._fillOutlineColorTransition = _parseDataProperty(
        context,
        'fill-outline-color-transition',
        map.remove('fill-outline-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-pattern')) {
      result._fillPattern = _parseDataProperty(
        context,
        'fill-pattern',
        map.remove('fill-pattern'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-pattern-transition')) {
      result._fillPatternTransition = _parseDataProperty(
        context,
        'fill-pattern-transition',
        map.remove('fill-pattern-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-translate')) {
      result._fillTranslate = _parseDataProperty(
        context,
        'fill-translate',
        map.remove('fill-translate'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-translate-anchor')) {
      result._fillTranslateAnchor = _parseDataProperty(
        context,
        'fill-translate-anchor',
        map.remove('fill-translate-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-translate-transition')) {
      result._fillTranslateTransition = _parseDataProperty(
        context,
        'fill-translate-transition',
        map.remove('fill-translate-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class LinePaint extends PaintProperties {
  LinePaint({
    Expression<num>? lineBlur,
    Transition? lineBlurTransition,
    Expression<Color>? lineColor,
    Transition? lineColorTransition,
    Expression<List<num>>? lineDasharray,
    Transition? lineDasharrayTransition,
    Expression<num>? lineGapWidth,
    Transition? lineGapWidthTransition,
    Expression<Color>? lineGradient,
    Expression<num>? lineOffset,
    Transition? lineOffsetTransition,
    Expression<num>? lineOpacity,
    Transition? lineOpacityTransition,
    Expression<ResolvedImage>? linePattern,
    Transition? linePatternTransition,
    Expression<List<num>>? lineTranslate,
    Expression<LineTranslateAnchor>? lineTranslateAnchor,
    Transition? lineTranslateTransition,
    Expression<num>? lineWidth,
    Transition? lineWidthTransition,
  })  : _lineBlur = lineBlur,
        _lineBlurTransition = lineBlurTransition,
        _lineColor = lineColor,
        _lineColorTransition = lineColorTransition,
        _lineDasharray = lineDasharray,
        _lineDasharrayTransition = lineDasharrayTransition,
        _lineGapWidth = lineGapWidth,
        _lineGapWidthTransition = lineGapWidthTransition,
        _lineGradient = lineGradient,
        _lineOffset = lineOffset,
        _lineOffsetTransition = lineOffsetTransition,
        _lineOpacity = lineOpacity,
        _lineOpacityTransition = lineOpacityTransition,
        _linePattern = linePattern,
        _linePatternTransition = linePatternTransition,
        _lineTranslate = lineTranslate,
        _lineTranslateAnchor = lineTranslateAnchor,
        _lineTranslateTransition = lineTranslateTransition,
        _lineWidth = lineWidth,
        _lineWidthTransition = lineWidthTransition,
        super._();

  Expression<num>? get lineBlur => _lineBlur;
  Expression<num>? _lineBlur;

  set lineBlur(Expression<num>? value) {
    _checkNotFrozen();
    _lineBlur = value;
  }

  Transition? get lineBlurTransition => _lineBlurTransition;
  Transition? _lineBlurTransition;

  set lineBlurTransition(Transition? value) {
    _checkNotFrozen();
    _lineBlurTransition = value;
  }

  Expression<Color>? get lineColor => _lineColor;
  Expression<Color>? _lineColor;

  set lineColor(Expression<Color>? value) {
    _checkNotFrozen();
    _lineColor = value;
  }

  Transition? get lineColorTransition => _lineColorTransition;
  Transition? _lineColorTransition;

  set lineColorTransition(Transition? value) {
    _checkNotFrozen();
    _lineColorTransition = value;
  }

  Expression<List<num>>? get lineDasharray => _lineDasharray;
  Expression<List<num>>? _lineDasharray;

  set lineDasharray(Expression<List<num>>? value) {
    _checkNotFrozen();
    _lineDasharray = value;
  }

  Transition? get lineDasharrayTransition => _lineDasharrayTransition;
  Transition? _lineDasharrayTransition;

  set lineDasharrayTransition(Transition? value) {
    _checkNotFrozen();
    _lineDasharrayTransition = value;
  }

  Expression<num>? get lineGapWidth => _lineGapWidth;
  Expression<num>? _lineGapWidth;

  set lineGapWidth(Expression<num>? value) {
    _checkNotFrozen();
    _lineGapWidth = value;
  }

  Transition? get lineGapWidthTransition => _lineGapWidthTransition;
  Transition? _lineGapWidthTransition;

  set lineGapWidthTransition(Transition? value) {
    _checkNotFrozen();
    _lineGapWidthTransition = value;
  }

  Expression<Color>? get lineGradient => _lineGradient;
  Expression<Color>? _lineGradient;

  set lineGradient(Expression<Color>? value) {
    _checkNotFrozen();
    _lineGradient = value;
  }

  Expression<num>? get lineOffset => _lineOffset;
  Expression<num>? _lineOffset;

  set lineOffset(Expression<num>? value) {
    _checkNotFrozen();
    _lineOffset = value;
  }

  Transition? get lineOffsetTransition => _lineOffsetTransition;
  Transition? _lineOffsetTransition;

  set lineOffsetTransition(Transition? value) {
    _checkNotFrozen();
    _lineOffsetTransition = value;
  }

  Expression<num>? get lineOpacity => _lineOpacity;
  Expression<num>? _lineOpacity;

  set lineOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _lineOpacity = value;
  }

  Transition? get lineOpacityTransition => _lineOpacityTransition;
  Transition? _lineOpacityTransition;

  set lineOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _lineOpacityTransition = value;
  }

  Expression<ResolvedImage>? get linePattern => _linePattern;
  Expression<ResolvedImage>? _linePattern;

  set linePattern(Expression<ResolvedImage>? value) {
    _checkNotFrozen();
    _linePattern = value;
  }

  Transition? get linePatternTransition => _linePatternTransition;
  Transition? _linePatternTransition;

  set linePatternTransition(Transition? value) {
    _checkNotFrozen();
    _linePatternTransition = value;
  }

  Expression<List<num>>? get lineTranslate => _lineTranslate;
  Expression<List<num>>? _lineTranslate;

  set lineTranslate(Expression<List<num>>? value) {
    _checkNotFrozen();
    _lineTranslate = value;
  }

  Expression<LineTranslateAnchor>? get lineTranslateAnchor =>
      _lineTranslateAnchor;
  Expression<LineTranslateAnchor>? _lineTranslateAnchor;

  set lineTranslateAnchor(Expression<LineTranslateAnchor>? value) {
    _checkNotFrozen();
    _lineTranslateAnchor = value;
  }

  Transition? get lineTranslateTransition => _lineTranslateTransition;
  Transition? _lineTranslateTransition;

  set lineTranslateTransition(Transition? value) {
    _checkNotFrozen();
    _lineTranslateTransition = value;
  }

  Expression<num>? get lineWidth => _lineWidth;
  Expression<num>? _lineWidth;

  set lineWidth(Expression<num>? value) {
    _checkNotFrozen();
    _lineWidth = value;
  }

  Transition? get lineWidthTransition => _lineWidthTransition;
  Transition? _lineWidthTransition;

  set lineWidthTransition(Transition? value) {
    _checkNotFrozen();
    _lineWidthTransition = value;
  }

  @override
  LinePaint copy() => LinePaint(
        lineBlur: _lineBlur,
        lineBlurTransition: () {
          final value = _lineBlurTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        lineColor: _lineColor,
        lineColorTransition: () {
          final value = _lineColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        lineDasharray: _lineDasharray,
        lineDasharrayTransition: () {
          final value = _lineDasharrayTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        lineGapWidth: _lineGapWidth,
        lineGapWidthTransition: () {
          final value = _lineGapWidthTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        lineGradient: _lineGradient,
        lineOffset: _lineOffset,
        lineOffsetTransition: () {
          final value = _lineOffsetTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        lineOpacity: _lineOpacity,
        lineOpacityTransition: () {
          final value = _lineOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        linePattern: _linePattern,
        linePatternTransition: () {
          final value = _linePatternTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        lineTranslate: _lineTranslate,
        lineTranslateAnchor: _lineTranslateAnchor,
        lineTranslateTransition: () {
          final value = _lineTranslateTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        lineWidth: _lineWidth,
        lineWidthTransition: () {
          final value = _lineWidthTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
      );

  @override
  void freeze() {
    () {
      final value = _lineBlurTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _lineColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _lineDasharrayTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _lineGapWidthTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _lineOffsetTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _lineOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _linePatternTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _lineTranslateTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _lineWidthTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_lineBlur != null) 'line-blur': _lineBlur!.value,
        if (_lineBlurTransition != null)
          'line-blur-transition': _lineBlurTransition!.toJson(),
        if (_lineColor != null) 'line-color': _lineColor!.value,
        if (_lineColorTransition != null)
          'line-color-transition': _lineColorTransition!.toJson(),
        if (_lineDasharray != null) 'line-dasharray': _lineDasharray!.value,
        if (_lineDasharrayTransition != null)
          'line-dasharray-transition': _lineDasharrayTransition!.toJson(),
        if (_lineGapWidth != null) 'line-gap-width': _lineGapWidth!.value,
        if (_lineGapWidthTransition != null)
          'line-gap-width-transition': _lineGapWidthTransition!.toJson(),
        if (_lineGradient != null) 'line-gradient': _lineGradient!.value,
        if (_lineOffset != null) 'line-offset': _lineOffset!.value,
        if (_lineOffsetTransition != null)
          'line-offset-transition': _lineOffsetTransition!.toJson(),
        if (_lineOpacity != null) 'line-opacity': _lineOpacity!.value,
        if (_lineOpacityTransition != null)
          'line-opacity-transition': _lineOpacityTransition!.toJson(),
        if (_linePattern != null) 'line-pattern': _linePattern!.value,
        if (_linePatternTransition != null)
          'line-pattern-transition': _linePatternTransition!.toJson(),
        if (_lineTranslate != null) 'line-translate': _lineTranslate!.value,
        if (_lineTranslateAnchor != null)
          'line-translate-anchor': _lineTranslateAnchor!.value,
        if (_lineTranslateTransition != null)
          'line-translate-transition': _lineTranslateTransition!.toJson(),
        if (_lineWidth != null) 'line-width': _lineWidth!.value,
        if (_lineWidthTransition != null)
          'line-width-transition': _lineWidthTransition!.toJson(),
      };

  static LinePaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = LinePaint();
    if (map.containsKey('line-blur')) {
      result._lineBlur = _parseDataProperty(
        context,
        'line-blur',
        map.remove('line-blur'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-blur-transition')) {
      result._lineBlurTransition = _parseDataProperty(
        context,
        'line-blur-transition',
        map.remove('line-blur-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('line-color')) {
      result._lineColor = _parseDataProperty(
        context,
        'line-color',
        map.remove('line-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-color-transition')) {
      result._lineColorTransition = _parseDataProperty(
        context,
        'line-color-transition',
        map.remove('line-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('line-dasharray')) {
      result._lineDasharray = _parseDataProperty(
        context,
        'line-dasharray',
        map.remove('line-dasharray'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-dasharray-transition')) {
      result._lineDasharrayTransition = _parseDataProperty(
        context,
        'line-dasharray-transition',
        map.remove('line-dasharray-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('line-gap-width')) {
      result._lineGapWidth = _parseDataProperty(
        context,
        'line-gap-width',
        map.remove('line-gap-width'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-gap-width-transition')) {
      result._lineGapWidthTransition = _parseDataProperty(
        context,
        'line-gap-width-transition',
        map.remove('line-gap-width-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('line-gradient')) {
      result._lineGradient = _parseDataProperty(
        context,
        'line-gradient',
        map.remove('line-gradient'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-offset')) {
      result._lineOffset = _parseDataProperty(
        context,
        'line-offset',
        map.remove('line-offset'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-offset-transition')) {
      result._lineOffsetTransition = _parseDataProperty(
        context,
        'line-offset-transition',
        map.remove('line-offset-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('line-opacity')) {
      result._lineOpacity = _parseDataProperty(
        context,
        'line-opacity',
        map.remove('line-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-opacity-transition')) {
      result._lineOpacityTransition = _parseDataProperty(
        context,
        'line-opacity-transition',
        map.remove('line-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('line-pattern')) {
      result._linePattern = _parseDataProperty(
        context,
        'line-pattern',
        map.remove('line-pattern'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-pattern-transition')) {
      result._linePatternTransition = _parseDataProperty(
        context,
        'line-pattern-transition',
        map.remove('line-pattern-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('line-translate')) {
      result._lineTranslate = _parseDataProperty(
        context,
        'line-translate',
        map.remove('line-translate'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-translate-anchor')) {
      result._lineTranslateAnchor = _parseDataProperty(
        context,
        'line-translate-anchor',
        map.remove('line-translate-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-translate-transition')) {
      result._lineTranslateTransition = _parseDataProperty(
        context,
        'line-translate-transition',
        map.remove('line-translate-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('line-width')) {
      result._lineWidth = _parseDataProperty(
        context,
        'line-width',
        map.remove('line-width'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('line-width-transition')) {
      result._lineWidthTransition = _parseDataProperty(
        context,
        'line-width-transition',
        map.remove('line-width-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class CirclePaint extends PaintProperties {
  CirclePaint({
    Expression<num>? circleBlur,
    Transition? circleBlurTransition,
    Expression<Color>? circleColor,
    Transition? circleColorTransition,
    Expression<num>? circleOpacity,
    Transition? circleOpacityTransition,
    Expression<CirclePitchAlignment>? circlePitchAlignment,
    Expression<CirclePitchScale>? circlePitchScale,
    Expression<num>? circleRadius,
    Transition? circleRadiusTransition,
    Expression<Color>? circleStrokeColor,
    Transition? circleStrokeColorTransition,
    Expression<num>? circleStrokeOpacity,
    Transition? circleStrokeOpacityTransition,
    Expression<num>? circleStrokeWidth,
    Transition? circleStrokeWidthTransition,
    Expression<List<num>>? circleTranslate,
    Expression<CircleTranslateAnchor>? circleTranslateAnchor,
    Transition? circleTranslateTransition,
  })  : _circleBlur = circleBlur,
        _circleBlurTransition = circleBlurTransition,
        _circleColor = circleColor,
        _circleColorTransition = circleColorTransition,
        _circleOpacity = circleOpacity,
        _circleOpacityTransition = circleOpacityTransition,
        _circlePitchAlignment = circlePitchAlignment,
        _circlePitchScale = circlePitchScale,
        _circleRadius = circleRadius,
        _circleRadiusTransition = circleRadiusTransition,
        _circleStrokeColor = circleStrokeColor,
        _circleStrokeColorTransition = circleStrokeColorTransition,
        _circleStrokeOpacity = circleStrokeOpacity,
        _circleStrokeOpacityTransition = circleStrokeOpacityTransition,
        _circleStrokeWidth = circleStrokeWidth,
        _circleStrokeWidthTransition = circleStrokeWidthTransition,
        _circleTranslate = circleTranslate,
        _circleTranslateAnchor = circleTranslateAnchor,
        _circleTranslateTransition = circleTranslateTransition,
        super._();

  Expression<num>? get circleBlur => _circleBlur;
  Expression<num>? _circleBlur;

  set circleBlur(Expression<num>? value) {
    _checkNotFrozen();
    _circleBlur = value;
  }

  Transition? get circleBlurTransition => _circleBlurTransition;
  Transition? _circleBlurTransition;

  set circleBlurTransition(Transition? value) {
    _checkNotFrozen();
    _circleBlurTransition = value;
  }

  Expression<Color>? get circleColor => _circleColor;
  Expression<Color>? _circleColor;

  set circleColor(Expression<Color>? value) {
    _checkNotFrozen();
    _circleColor = value;
  }

  Transition? get circleColorTransition => _circleColorTransition;
  Transition? _circleColorTransition;

  set circleColorTransition(Transition? value) {
    _checkNotFrozen();
    _circleColorTransition = value;
  }

  Expression<num>? get circleOpacity => _circleOpacity;
  Expression<num>? _circleOpacity;

  set circleOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _circleOpacity = value;
  }

  Transition? get circleOpacityTransition => _circleOpacityTransition;
  Transition? _circleOpacityTransition;

  set circleOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _circleOpacityTransition = value;
  }

  Expression<CirclePitchAlignment>? get circlePitchAlignment =>
      _circlePitchAlignment;
  Expression<CirclePitchAlignment>? _circlePitchAlignment;

  set circlePitchAlignment(Expression<CirclePitchAlignment>? value) {
    _checkNotFrozen();
    _circlePitchAlignment = value;
  }

  Expression<CirclePitchScale>? get circlePitchScale => _circlePitchScale;
  Expression<CirclePitchScale>? _circlePitchScale;

  set circlePitchScale(Expression<CirclePitchScale>? value) {
    _checkNotFrozen();
    _circlePitchScale = value;
  }

  Expression<num>? get circleRadius => _circleRadius;
  Expression<num>? _circleRadius;

  set circleRadius(Expression<num>? value) {
    _checkNotFrozen();
    _circleRadius = value;
  }

  Transition? get circleRadiusTransition => _circleRadiusTransition;
  Transition? _circleRadiusTransition;

  set circleRadiusTransition(Transition? value) {
    _checkNotFrozen();
    _circleRadiusTransition = value;
  }

  Expression<Color>? get circleStrokeColor => _circleStrokeColor;
  Expression<Color>? _circleStrokeColor;

  set circleStrokeColor(Expression<Color>? value) {
    _checkNotFrozen();
    _circleStrokeColor = value;
  }

  Transition? get circleStrokeColorTransition => _circleStrokeColorTransition;
  Transition? _circleStrokeColorTransition;

  set circleStrokeColorTransition(Transition? value) {
    _checkNotFrozen();
    _circleStrokeColorTransition = value;
  }

  Expression<num>? get circleStrokeOpacity => _circleStrokeOpacity;
  Expression<num>? _circleStrokeOpacity;

  set circleStrokeOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _circleStrokeOpacity = value;
  }

  Transition? get circleStrokeOpacityTransition =>
      _circleStrokeOpacityTransition;
  Transition? _circleStrokeOpacityTransition;

  set circleStrokeOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _circleStrokeOpacityTransition = value;
  }

  Expression<num>? get circleStrokeWidth => _circleStrokeWidth;
  Expression<num>? _circleStrokeWidth;

  set circleStrokeWidth(Expression<num>? value) {
    _checkNotFrozen();
    _circleStrokeWidth = value;
  }

  Transition? get circleStrokeWidthTransition => _circleStrokeWidthTransition;
  Transition? _circleStrokeWidthTransition;

  set circleStrokeWidthTransition(Transition? value) {
    _checkNotFrozen();
    _circleStrokeWidthTransition = value;
  }

  Expression<List<num>>? get circleTranslate => _circleTranslate;
  Expression<List<num>>? _circleTranslate;

  set circleTranslate(Expression<List<num>>? value) {
    _checkNotFrozen();
    _circleTranslate = value;
  }

  Expression<CircleTranslateAnchor>? get circleTranslateAnchor =>
      _circleTranslateAnchor;
  Expression<CircleTranslateAnchor>? _circleTranslateAnchor;

  set circleTranslateAnchor(Expression<CircleTranslateAnchor>? value) {
    _checkNotFrozen();
    _circleTranslateAnchor = value;
  }

  Transition? get circleTranslateTransition => _circleTranslateTransition;
  Transition? _circleTranslateTransition;

  set circleTranslateTransition(Transition? value) {
    _checkNotFrozen();
    _circleTranslateTransition = value;
  }

  @override
  CirclePaint copy() => CirclePaint(
        circleBlur: _circleBlur,
        circleBlurTransition: () {
          final value = _circleBlurTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        circleColor: _circleColor,
        circleColorTransition: () {
          final value = _circleColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        circleOpacity: _circleOpacity,
        circleOpacityTransition: () {
          final value = _circleOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        circlePitchAlignment: _circlePitchAlignment,
        circlePitchScale: _circlePitchScale,
        circleRadius: _circleRadius,
        circleRadiusTransition: () {
          final value = _circleRadiusTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        circleStrokeColor: _circleStrokeColor,
        circleStrokeColorTransition: () {
          final value = _circleStrokeColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        circleStrokeOpacity: _circleStrokeOpacity,
        circleStrokeOpacityTransition: () {
          final value = _circleStrokeOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        circleStrokeWidth: _circleStrokeWidth,
        circleStrokeWidthTransition: () {
          final value = _circleStrokeWidthTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        circleTranslate: _circleTranslate,
        circleTranslateAnchor: _circleTranslateAnchor,
        circleTranslateTransition: () {
          final value = _circleTranslateTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
      );

  @override
  void freeze() {
    () {
      final value = _circleBlurTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _circleColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _circleOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _circleRadiusTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _circleStrokeColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _circleStrokeOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _circleStrokeWidthTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _circleTranslateTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_circleBlur != null) 'circle-blur': _circleBlur!.value,
        if (_circleBlurTransition != null)
          'circle-blur-transition': _circleBlurTransition!.toJson(),
        if (_circleColor != null) 'circle-color': _circleColor!.value,
        if (_circleColorTransition != null)
          'circle-color-transition': _circleColorTransition!.toJson(),
        if (_circleOpacity != null) 'circle-opacity': _circleOpacity!.value,
        if (_circleOpacityTransition != null)
          'circle-opacity-transition': _circleOpacityTransition!.toJson(),
        if (_circlePitchAlignment != null)
          'circle-pitch-alignment': _circlePitchAlignment!.value,
        if (_circlePitchScale != null)
          'circle-pitch-scale': _circlePitchScale!.value,
        if (_circleRadius != null) 'circle-radius': _circleRadius!.value,
        if (_circleRadiusTransition != null)
          'circle-radius-transition': _circleRadiusTransition!.toJson(),
        if (_circleStrokeColor != null)
          'circle-stroke-color': _circleStrokeColor!.value,
        if (_circleStrokeColorTransition != null)
          'circle-stroke-color-transition':
              _circleStrokeColorTransition!.toJson(),
        if (_circleStrokeOpacity != null)
          'circle-stroke-opacity': _circleStrokeOpacity!.value,
        if (_circleStrokeOpacityTransition != null)
          'circle-stroke-opacity-transition':
              _circleStrokeOpacityTransition!.toJson(),
        if (_circleStrokeWidth != null)
          'circle-stroke-width': _circleStrokeWidth!.value,
        if (_circleStrokeWidthTransition != null)
          'circle-stroke-width-transition':
              _circleStrokeWidthTransition!.toJson(),
        if (_circleTranslate != null)
          'circle-translate': _circleTranslate!.value,
        if (_circleTranslateAnchor != null)
          'circle-translate-anchor': _circleTranslateAnchor!.value,
        if (_circleTranslateTransition != null)
          'circle-translate-transition': _circleTranslateTransition!.toJson(),
      };

  static CirclePaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = CirclePaint();
    if (map.containsKey('circle-blur')) {
      result._circleBlur = _parseDataProperty(
        context,
        'circle-blur',
        map.remove('circle-blur'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-blur-transition')) {
      result._circleBlurTransition = _parseDataProperty(
        context,
        'circle-blur-transition',
        map.remove('circle-blur-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('circle-color')) {
      result._circleColor = _parseDataProperty(
        context,
        'circle-color',
        map.remove('circle-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-color-transition')) {
      result._circleColorTransition = _parseDataProperty(
        context,
        'circle-color-transition',
        map.remove('circle-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('circle-opacity')) {
      result._circleOpacity = _parseDataProperty(
        context,
        'circle-opacity',
        map.remove('circle-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-opacity-transition')) {
      result._circleOpacityTransition = _parseDataProperty(
        context,
        'circle-opacity-transition',
        map.remove('circle-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('circle-pitch-alignment')) {
      result._circlePitchAlignment = _parseDataProperty(
        context,
        'circle-pitch-alignment',
        map.remove('circle-pitch-alignment'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-pitch-scale')) {
      result._circlePitchScale = _parseDataProperty(
        context,
        'circle-pitch-scale',
        map.remove('circle-pitch-scale'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-radius')) {
      result._circleRadius = _parseDataProperty(
        context,
        'circle-radius',
        map.remove('circle-radius'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-radius-transition')) {
      result._circleRadiusTransition = _parseDataProperty(
        context,
        'circle-radius-transition',
        map.remove('circle-radius-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('circle-stroke-color')) {
      result._circleStrokeColor = _parseDataProperty(
        context,
        'circle-stroke-color',
        map.remove('circle-stroke-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-stroke-color-transition')) {
      result._circleStrokeColorTransition = _parseDataProperty(
        context,
        'circle-stroke-color-transition',
        map.remove('circle-stroke-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('circle-stroke-opacity')) {
      result._circleStrokeOpacity = _parseDataProperty(
        context,
        'circle-stroke-opacity',
        map.remove('circle-stroke-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-stroke-opacity-transition')) {
      result._circleStrokeOpacityTransition = _parseDataProperty(
        context,
        'circle-stroke-opacity-transition',
        map.remove('circle-stroke-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('circle-stroke-width')) {
      result._circleStrokeWidth = _parseDataProperty(
        context,
        'circle-stroke-width',
        map.remove('circle-stroke-width'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-stroke-width-transition')) {
      result._circleStrokeWidthTransition = _parseDataProperty(
        context,
        'circle-stroke-width-transition',
        map.remove('circle-stroke-width-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('circle-translate')) {
      result._circleTranslate = _parseDataProperty(
        context,
        'circle-translate',
        map.remove('circle-translate'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-translate-anchor')) {
      result._circleTranslateAnchor = _parseDataProperty(
        context,
        'circle-translate-anchor',
        map.remove('circle-translate-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('circle-translate-transition')) {
      result._circleTranslateTransition = _parseDataProperty(
        context,
        'circle-translate-transition',
        map.remove('circle-translate-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class HeatmapPaint extends PaintProperties {
  HeatmapPaint({
    Expression<Color>? heatmapColor,
    Expression<num>? heatmapIntensity,
    Transition? heatmapIntensityTransition,
    Expression<num>? heatmapOpacity,
    Transition? heatmapOpacityTransition,
    Expression<num>? heatmapRadius,
    Transition? heatmapRadiusTransition,
    Expression<num>? heatmapWeight,
  })  : _heatmapColor = heatmapColor,
        _heatmapIntensity = heatmapIntensity,
        _heatmapIntensityTransition = heatmapIntensityTransition,
        _heatmapOpacity = heatmapOpacity,
        _heatmapOpacityTransition = heatmapOpacityTransition,
        _heatmapRadius = heatmapRadius,
        _heatmapRadiusTransition = heatmapRadiusTransition,
        _heatmapWeight = heatmapWeight,
        super._();

  Expression<Color>? get heatmapColor => _heatmapColor;
  Expression<Color>? _heatmapColor;

  set heatmapColor(Expression<Color>? value) {
    _checkNotFrozen();
    _heatmapColor = value;
  }

  Expression<num>? get heatmapIntensity => _heatmapIntensity;
  Expression<num>? _heatmapIntensity;

  set heatmapIntensity(Expression<num>? value) {
    _checkNotFrozen();
    _heatmapIntensity = value;
  }

  Transition? get heatmapIntensityTransition => _heatmapIntensityTransition;
  Transition? _heatmapIntensityTransition;

  set heatmapIntensityTransition(Transition? value) {
    _checkNotFrozen();
    _heatmapIntensityTransition = value;
  }

  Expression<num>? get heatmapOpacity => _heatmapOpacity;
  Expression<num>? _heatmapOpacity;

  set heatmapOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _heatmapOpacity = value;
  }

  Transition? get heatmapOpacityTransition => _heatmapOpacityTransition;
  Transition? _heatmapOpacityTransition;

  set heatmapOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _heatmapOpacityTransition = value;
  }

  Expression<num>? get heatmapRadius => _heatmapRadius;
  Expression<num>? _heatmapRadius;

  set heatmapRadius(Expression<num>? value) {
    _checkNotFrozen();
    _heatmapRadius = value;
  }

  Transition? get heatmapRadiusTransition => _heatmapRadiusTransition;
  Transition? _heatmapRadiusTransition;

  set heatmapRadiusTransition(Transition? value) {
    _checkNotFrozen();
    _heatmapRadiusTransition = value;
  }

  Expression<num>? get heatmapWeight => _heatmapWeight;
  Expression<num>? _heatmapWeight;

  set heatmapWeight(Expression<num>? value) {
    _checkNotFrozen();
    _heatmapWeight = value;
  }

  @override
  HeatmapPaint copy() => HeatmapPaint(
        heatmapColor: _heatmapColor,
        heatmapIntensity: _heatmapIntensity,
        heatmapIntensityTransition: () {
          final value = _heatmapIntensityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        heatmapOpacity: _heatmapOpacity,
        heatmapOpacityTransition: () {
          final value = _heatmapOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        heatmapRadius: _heatmapRadius,
        heatmapRadiusTransition: () {
          final value = _heatmapRadiusTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        heatmapWeight: _heatmapWeight,
      );

  @override
  void freeze() {
    () {
      final value = _heatmapIntensityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _heatmapOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _heatmapRadiusTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_heatmapColor != null) 'heatmap-color': _heatmapColor!.value,
        if (_heatmapIntensity != null)
          'heatmap-intensity': _heatmapIntensity!.value,
        if (_heatmapIntensityTransition != null)
          'heatmap-intensity-transition': _heatmapIntensityTransition!.toJson(),
        if (_heatmapOpacity != null) 'heatmap-opacity': _heatmapOpacity!.value,
        if (_heatmapOpacityTransition != null)
          'heatmap-opacity-transition': _heatmapOpacityTransition!.toJson(),
        if (_heatmapRadius != null) 'heatmap-radius': _heatmapRadius!.value,
        if (_heatmapRadiusTransition != null)
          'heatmap-radius-transition': _heatmapRadiusTransition!.toJson(),
        if (_heatmapWeight != null) 'heatmap-weight': _heatmapWeight!.value,
      };

  static HeatmapPaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = HeatmapPaint();
    if (map.containsKey('heatmap-color')) {
      result._heatmapColor = _parseDataProperty(
        context,
        'heatmap-color',
        map.remove('heatmap-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('heatmap-intensity')) {
      result._heatmapIntensity = _parseDataProperty(
        context,
        'heatmap-intensity',
        map.remove('heatmap-intensity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('heatmap-intensity-transition')) {
      result._heatmapIntensityTransition = _parseDataProperty(
        context,
        'heatmap-intensity-transition',
        map.remove('heatmap-intensity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('heatmap-opacity')) {
      result._heatmapOpacity = _parseDataProperty(
        context,
        'heatmap-opacity',
        map.remove('heatmap-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('heatmap-opacity-transition')) {
      result._heatmapOpacityTransition = _parseDataProperty(
        context,
        'heatmap-opacity-transition',
        map.remove('heatmap-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('heatmap-radius')) {
      result._heatmapRadius = _parseDataProperty(
        context,
        'heatmap-radius',
        map.remove('heatmap-radius'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('heatmap-radius-transition')) {
      result._heatmapRadiusTransition = _parseDataProperty(
        context,
        'heatmap-radius-transition',
        map.remove('heatmap-radius-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('heatmap-weight')) {
      result._heatmapWeight = _parseDataProperty(
        context,
        'heatmap-weight',
        map.remove('heatmap-weight'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class FillExtrusionPaint extends PaintProperties {
  FillExtrusionPaint({
    Expression<num>? fillExtrusionBase,
    Transition? fillExtrusionBaseTransition,
    Expression<Color>? fillExtrusionColor,
    Transition? fillExtrusionColorTransition,
    Expression<num>? fillExtrusionHeight,
    Transition? fillExtrusionHeightTransition,
    Expression<num>? fillExtrusionOpacity,
    Transition? fillExtrusionOpacityTransition,
    Expression<ResolvedImage>? fillExtrusionPattern,
    Transition? fillExtrusionPatternTransition,
    Expression<List<num>>? fillExtrusionTranslate,
    Expression<FillExtrusionTranslateAnchor>? fillExtrusionTranslateAnchor,
    Transition? fillExtrusionTranslateTransition,
    Expression<bool>? fillExtrusionVerticalGradient,
  })  : _fillExtrusionBase = fillExtrusionBase,
        _fillExtrusionBaseTransition = fillExtrusionBaseTransition,
        _fillExtrusionColor = fillExtrusionColor,
        _fillExtrusionColorTransition = fillExtrusionColorTransition,
        _fillExtrusionHeight = fillExtrusionHeight,
        _fillExtrusionHeightTransition = fillExtrusionHeightTransition,
        _fillExtrusionOpacity = fillExtrusionOpacity,
        _fillExtrusionOpacityTransition = fillExtrusionOpacityTransition,
        _fillExtrusionPattern = fillExtrusionPattern,
        _fillExtrusionPatternTransition = fillExtrusionPatternTransition,
        _fillExtrusionTranslate = fillExtrusionTranslate,
        _fillExtrusionTranslateAnchor = fillExtrusionTranslateAnchor,
        _fillExtrusionTranslateTransition = fillExtrusionTranslateTransition,
        _fillExtrusionVerticalGradient = fillExtrusionVerticalGradient,
        super._();

  Expression<num>? get fillExtrusionBase => _fillExtrusionBase;
  Expression<num>? _fillExtrusionBase;

  set fillExtrusionBase(Expression<num>? value) {
    _checkNotFrozen();
    _fillExtrusionBase = value;
  }

  Transition? get fillExtrusionBaseTransition => _fillExtrusionBaseTransition;
  Transition? _fillExtrusionBaseTransition;

  set fillExtrusionBaseTransition(Transition? value) {
    _checkNotFrozen();
    _fillExtrusionBaseTransition = value;
  }

  Expression<Color>? get fillExtrusionColor => _fillExtrusionColor;
  Expression<Color>? _fillExtrusionColor;

  set fillExtrusionColor(Expression<Color>? value) {
    _checkNotFrozen();
    _fillExtrusionColor = value;
  }

  Transition? get fillExtrusionColorTransition => _fillExtrusionColorTransition;
  Transition? _fillExtrusionColorTransition;

  set fillExtrusionColorTransition(Transition? value) {
    _checkNotFrozen();
    _fillExtrusionColorTransition = value;
  }

  Expression<num>? get fillExtrusionHeight => _fillExtrusionHeight;
  Expression<num>? _fillExtrusionHeight;

  set fillExtrusionHeight(Expression<num>? value) {
    _checkNotFrozen();
    _fillExtrusionHeight = value;
  }

  Transition? get fillExtrusionHeightTransition =>
      _fillExtrusionHeightTransition;
  Transition? _fillExtrusionHeightTransition;

  set fillExtrusionHeightTransition(Transition? value) {
    _checkNotFrozen();
    _fillExtrusionHeightTransition = value;
  }

  Expression<num>? get fillExtrusionOpacity => _fillExtrusionOpacity;
  Expression<num>? _fillExtrusionOpacity;

  set fillExtrusionOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _fillExtrusionOpacity = value;
  }

  Transition? get fillExtrusionOpacityTransition =>
      _fillExtrusionOpacityTransition;
  Transition? _fillExtrusionOpacityTransition;

  set fillExtrusionOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _fillExtrusionOpacityTransition = value;
  }

  Expression<ResolvedImage>? get fillExtrusionPattern => _fillExtrusionPattern;
  Expression<ResolvedImage>? _fillExtrusionPattern;

  set fillExtrusionPattern(Expression<ResolvedImage>? value) {
    _checkNotFrozen();
    _fillExtrusionPattern = value;
  }

  Transition? get fillExtrusionPatternTransition =>
      _fillExtrusionPatternTransition;
  Transition? _fillExtrusionPatternTransition;

  set fillExtrusionPatternTransition(Transition? value) {
    _checkNotFrozen();
    _fillExtrusionPatternTransition = value;
  }

  Expression<List<num>>? get fillExtrusionTranslate => _fillExtrusionTranslate;
  Expression<List<num>>? _fillExtrusionTranslate;

  set fillExtrusionTranslate(Expression<List<num>>? value) {
    _checkNotFrozen();
    _fillExtrusionTranslate = value;
  }

  Expression<FillExtrusionTranslateAnchor>? get fillExtrusionTranslateAnchor =>
      _fillExtrusionTranslateAnchor;
  Expression<FillExtrusionTranslateAnchor>? _fillExtrusionTranslateAnchor;

  set fillExtrusionTranslateAnchor(
      Expression<FillExtrusionTranslateAnchor>? value) {
    _checkNotFrozen();
    _fillExtrusionTranslateAnchor = value;
  }

  Transition? get fillExtrusionTranslateTransition =>
      _fillExtrusionTranslateTransition;
  Transition? _fillExtrusionTranslateTransition;

  set fillExtrusionTranslateTransition(Transition? value) {
    _checkNotFrozen();
    _fillExtrusionTranslateTransition = value;
  }

  Expression<bool>? get fillExtrusionVerticalGradient =>
      _fillExtrusionVerticalGradient;
  Expression<bool>? _fillExtrusionVerticalGradient;

  set fillExtrusionVerticalGradient(Expression<bool>? value) {
    _checkNotFrozen();
    _fillExtrusionVerticalGradient = value;
  }

  @override
  FillExtrusionPaint copy() => FillExtrusionPaint(
        fillExtrusionBase: _fillExtrusionBase,
        fillExtrusionBaseTransition: () {
          final value = _fillExtrusionBaseTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillExtrusionColor: _fillExtrusionColor,
        fillExtrusionColorTransition: () {
          final value = _fillExtrusionColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillExtrusionHeight: _fillExtrusionHeight,
        fillExtrusionHeightTransition: () {
          final value = _fillExtrusionHeightTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillExtrusionOpacity: _fillExtrusionOpacity,
        fillExtrusionOpacityTransition: () {
          final value = _fillExtrusionOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillExtrusionPattern: _fillExtrusionPattern,
        fillExtrusionPatternTransition: () {
          final value = _fillExtrusionPatternTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillExtrusionTranslate: _fillExtrusionTranslate,
        fillExtrusionTranslateAnchor: _fillExtrusionTranslateAnchor,
        fillExtrusionTranslateTransition: () {
          final value = _fillExtrusionTranslateTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        fillExtrusionVerticalGradient: _fillExtrusionVerticalGradient,
      );

  @override
  void freeze() {
    () {
      final value = _fillExtrusionBaseTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _fillExtrusionColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _fillExtrusionHeightTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _fillExtrusionOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _fillExtrusionPatternTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _fillExtrusionTranslateTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_fillExtrusionBase != null)
          'fill-extrusion-base': _fillExtrusionBase!.value,
        if (_fillExtrusionBaseTransition != null)
          'fill-extrusion-base-transition':
              _fillExtrusionBaseTransition!.toJson(),
        if (_fillExtrusionColor != null)
          'fill-extrusion-color': _fillExtrusionColor!.value,
        if (_fillExtrusionColorTransition != null)
          'fill-extrusion-color-transition':
              _fillExtrusionColorTransition!.toJson(),
        if (_fillExtrusionHeight != null)
          'fill-extrusion-height': _fillExtrusionHeight!.value,
        if (_fillExtrusionHeightTransition != null)
          'fill-extrusion-height-transition':
              _fillExtrusionHeightTransition!.toJson(),
        if (_fillExtrusionOpacity != null)
          'fill-extrusion-opacity': _fillExtrusionOpacity!.value,
        if (_fillExtrusionOpacityTransition != null)
          'fill-extrusion-opacity-transition':
              _fillExtrusionOpacityTransition!.toJson(),
        if (_fillExtrusionPattern != null)
          'fill-extrusion-pattern': _fillExtrusionPattern!.value,
        if (_fillExtrusionPatternTransition != null)
          'fill-extrusion-pattern-transition':
              _fillExtrusionPatternTransition!.toJson(),
        if (_fillExtrusionTranslate != null)
          'fill-extrusion-translate': _fillExtrusionTranslate!.value,
        if (_fillExtrusionTranslateAnchor != null)
          'fill-extrusion-translate-anchor':
              _fillExtrusionTranslateAnchor!.value,
        if (_fillExtrusionTranslateTransition != null)
          'fill-extrusion-translate-transition':
              _fillExtrusionTranslateTransition!.toJson(),
        if (_fillExtrusionVerticalGradient != null)
          'fill-extrusion-vertical-gradient':
              _fillExtrusionVerticalGradient!.value,
      };

  static FillExtrusionPaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = FillExtrusionPaint();
    if (map.containsKey('fill-extrusion-base')) {
      result._fillExtrusionBase = _parseDataProperty(
        context,
        'fill-extrusion-base',
        map.remove('fill-extrusion-base'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-base-transition')) {
      result._fillExtrusionBaseTransition = _parseDataProperty(
        context,
        'fill-extrusion-base-transition',
        map.remove('fill-extrusion-base-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-color')) {
      result._fillExtrusionColor = _parseDataProperty(
        context,
        'fill-extrusion-color',
        map.remove('fill-extrusion-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-color-transition')) {
      result._fillExtrusionColorTransition = _parseDataProperty(
        context,
        'fill-extrusion-color-transition',
        map.remove('fill-extrusion-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-height')) {
      result._fillExtrusionHeight = _parseDataProperty(
        context,
        'fill-extrusion-height',
        map.remove('fill-extrusion-height'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-height-transition')) {
      result._fillExtrusionHeightTransition = _parseDataProperty(
        context,
        'fill-extrusion-height-transition',
        map.remove('fill-extrusion-height-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-opacity')) {
      result._fillExtrusionOpacity = _parseDataProperty(
        context,
        'fill-extrusion-opacity',
        map.remove('fill-extrusion-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-opacity-transition')) {
      result._fillExtrusionOpacityTransition = _parseDataProperty(
        context,
        'fill-extrusion-opacity-transition',
        map.remove('fill-extrusion-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-pattern')) {
      result._fillExtrusionPattern = _parseDataProperty(
        context,
        'fill-extrusion-pattern',
        map.remove('fill-extrusion-pattern'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-pattern-transition')) {
      result._fillExtrusionPatternTransition = _parseDataProperty(
        context,
        'fill-extrusion-pattern-transition',
        map.remove('fill-extrusion-pattern-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-translate')) {
      result._fillExtrusionTranslate = _parseDataProperty(
        context,
        'fill-extrusion-translate',
        map.remove('fill-extrusion-translate'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-translate-anchor')) {
      result._fillExtrusionTranslateAnchor = _parseDataProperty(
        context,
        'fill-extrusion-translate-anchor',
        map.remove('fill-extrusion-translate-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-translate-transition')) {
      result._fillExtrusionTranslateTransition = _parseDataProperty(
        context,
        'fill-extrusion-translate-transition',
        map.remove('fill-extrusion-translate-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('fill-extrusion-vertical-gradient')) {
      result._fillExtrusionVerticalGradient = _parseDataProperty(
        context,
        'fill-extrusion-vertical-gradient',
        map.remove('fill-extrusion-vertical-gradient'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class SymbolPaint extends PaintProperties {
  SymbolPaint({
    Expression<Color>? iconColor,
    Transition? iconColorTransition,
    Expression<num>? iconHaloBlur,
    Transition? iconHaloBlurTransition,
    Expression<Color>? iconHaloColor,
    Transition? iconHaloColorTransition,
    Expression<num>? iconHaloWidth,
    Transition? iconHaloWidthTransition,
    Expression<num>? iconOpacity,
    Transition? iconOpacityTransition,
    Expression<List<num>>? iconTranslate,
    Expression<IconTranslateAnchor>? iconTranslateAnchor,
    Transition? iconTranslateTransition,
    Expression<Color>? textColor,
    Transition? textColorTransition,
    Expression<num>? textHaloBlur,
    Transition? textHaloBlurTransition,
    Expression<Color>? textHaloColor,
    Transition? textHaloColorTransition,
    Expression<num>? textHaloWidth,
    Transition? textHaloWidthTransition,
    Expression<num>? textOpacity,
    Transition? textOpacityTransition,
    Expression<List<num>>? textTranslate,
    Expression<TextTranslateAnchor>? textTranslateAnchor,
    Transition? textTranslateTransition,
  })  : _iconColor = iconColor,
        _iconColorTransition = iconColorTransition,
        _iconHaloBlur = iconHaloBlur,
        _iconHaloBlurTransition = iconHaloBlurTransition,
        _iconHaloColor = iconHaloColor,
        _iconHaloColorTransition = iconHaloColorTransition,
        _iconHaloWidth = iconHaloWidth,
        _iconHaloWidthTransition = iconHaloWidthTransition,
        _iconOpacity = iconOpacity,
        _iconOpacityTransition = iconOpacityTransition,
        _iconTranslate = iconTranslate,
        _iconTranslateAnchor = iconTranslateAnchor,
        _iconTranslateTransition = iconTranslateTransition,
        _textColor = textColor,
        _textColorTransition = textColorTransition,
        _textHaloBlur = textHaloBlur,
        _textHaloBlurTransition = textHaloBlurTransition,
        _textHaloColor = textHaloColor,
        _textHaloColorTransition = textHaloColorTransition,
        _textHaloWidth = textHaloWidth,
        _textHaloWidthTransition = textHaloWidthTransition,
        _textOpacity = textOpacity,
        _textOpacityTransition = textOpacityTransition,
        _textTranslate = textTranslate,
        _textTranslateAnchor = textTranslateAnchor,
        _textTranslateTransition = textTranslateTransition,
        super._();

  Expression<Color>? get iconColor => _iconColor;
  Expression<Color>? _iconColor;

  set iconColor(Expression<Color>? value) {
    _checkNotFrozen();
    _iconColor = value;
  }

  Transition? get iconColorTransition => _iconColorTransition;
  Transition? _iconColorTransition;

  set iconColorTransition(Transition? value) {
    _checkNotFrozen();
    _iconColorTransition = value;
  }

  Expression<num>? get iconHaloBlur => _iconHaloBlur;
  Expression<num>? _iconHaloBlur;

  set iconHaloBlur(Expression<num>? value) {
    _checkNotFrozen();
    _iconHaloBlur = value;
  }

  Transition? get iconHaloBlurTransition => _iconHaloBlurTransition;
  Transition? _iconHaloBlurTransition;

  set iconHaloBlurTransition(Transition? value) {
    _checkNotFrozen();
    _iconHaloBlurTransition = value;
  }

  Expression<Color>? get iconHaloColor => _iconHaloColor;
  Expression<Color>? _iconHaloColor;

  set iconHaloColor(Expression<Color>? value) {
    _checkNotFrozen();
    _iconHaloColor = value;
  }

  Transition? get iconHaloColorTransition => _iconHaloColorTransition;
  Transition? _iconHaloColorTransition;

  set iconHaloColorTransition(Transition? value) {
    _checkNotFrozen();
    _iconHaloColorTransition = value;
  }

  Expression<num>? get iconHaloWidth => _iconHaloWidth;
  Expression<num>? _iconHaloWidth;

  set iconHaloWidth(Expression<num>? value) {
    _checkNotFrozen();
    _iconHaloWidth = value;
  }

  Transition? get iconHaloWidthTransition => _iconHaloWidthTransition;
  Transition? _iconHaloWidthTransition;

  set iconHaloWidthTransition(Transition? value) {
    _checkNotFrozen();
    _iconHaloWidthTransition = value;
  }

  Expression<num>? get iconOpacity => _iconOpacity;
  Expression<num>? _iconOpacity;

  set iconOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _iconOpacity = value;
  }

  Transition? get iconOpacityTransition => _iconOpacityTransition;
  Transition? _iconOpacityTransition;

  set iconOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _iconOpacityTransition = value;
  }

  Expression<List<num>>? get iconTranslate => _iconTranslate;
  Expression<List<num>>? _iconTranslate;

  set iconTranslate(Expression<List<num>>? value) {
    _checkNotFrozen();
    _iconTranslate = value;
  }

  Expression<IconTranslateAnchor>? get iconTranslateAnchor =>
      _iconTranslateAnchor;
  Expression<IconTranslateAnchor>? _iconTranslateAnchor;

  set iconTranslateAnchor(Expression<IconTranslateAnchor>? value) {
    _checkNotFrozen();
    _iconTranslateAnchor = value;
  }

  Transition? get iconTranslateTransition => _iconTranslateTransition;
  Transition? _iconTranslateTransition;

  set iconTranslateTransition(Transition? value) {
    _checkNotFrozen();
    _iconTranslateTransition = value;
  }

  Expression<Color>? get textColor => _textColor;
  Expression<Color>? _textColor;

  set textColor(Expression<Color>? value) {
    _checkNotFrozen();
    _textColor = value;
  }

  Transition? get textColorTransition => _textColorTransition;
  Transition? _textColorTransition;

  set textColorTransition(Transition? value) {
    _checkNotFrozen();
    _textColorTransition = value;
  }

  Expression<num>? get textHaloBlur => _textHaloBlur;
  Expression<num>? _textHaloBlur;

  set textHaloBlur(Expression<num>? value) {
    _checkNotFrozen();
    _textHaloBlur = value;
  }

  Transition? get textHaloBlurTransition => _textHaloBlurTransition;
  Transition? _textHaloBlurTransition;

  set textHaloBlurTransition(Transition? value) {
    _checkNotFrozen();
    _textHaloBlurTransition = value;
  }

  Expression<Color>? get textHaloColor => _textHaloColor;
  Expression<Color>? _textHaloColor;

  set textHaloColor(Expression<Color>? value) {
    _checkNotFrozen();
    _textHaloColor = value;
  }

  Transition? get textHaloColorTransition => _textHaloColorTransition;
  Transition? _textHaloColorTransition;

  set textHaloColorTransition(Transition? value) {
    _checkNotFrozen();
    _textHaloColorTransition = value;
  }

  Expression<num>? get textHaloWidth => _textHaloWidth;
  Expression<num>? _textHaloWidth;

  set textHaloWidth(Expression<num>? value) {
    _checkNotFrozen();
    _textHaloWidth = value;
  }

  Transition? get textHaloWidthTransition => _textHaloWidthTransition;
  Transition? _textHaloWidthTransition;

  set textHaloWidthTransition(Transition? value) {
    _checkNotFrozen();
    _textHaloWidthTransition = value;
  }

  Expression<num>? get textOpacity => _textOpacity;
  Expression<num>? _textOpacity;

  set textOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _textOpacity = value;
  }

  Transition? get textOpacityTransition => _textOpacityTransition;
  Transition? _textOpacityTransition;

  set textOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _textOpacityTransition = value;
  }

  Expression<List<num>>? get textTranslate => _textTranslate;
  Expression<List<num>>? _textTranslate;

  set textTranslate(Expression<List<num>>? value) {
    _checkNotFrozen();
    _textTranslate = value;
  }

  Expression<TextTranslateAnchor>? get textTranslateAnchor =>
      _textTranslateAnchor;
  Expression<TextTranslateAnchor>? _textTranslateAnchor;

  set textTranslateAnchor(Expression<TextTranslateAnchor>? value) {
    _checkNotFrozen();
    _textTranslateAnchor = value;
  }

  Transition? get textTranslateTransition => _textTranslateTransition;
  Transition? _textTranslateTransition;

  set textTranslateTransition(Transition? value) {
    _checkNotFrozen();
    _textTranslateTransition = value;
  }

  @override
  SymbolPaint copy() => SymbolPaint(
        iconColor: _iconColor,
        iconColorTransition: () {
          final value = _iconColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        iconHaloBlur: _iconHaloBlur,
        iconHaloBlurTransition: () {
          final value = _iconHaloBlurTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        iconHaloColor: _iconHaloColor,
        iconHaloColorTransition: () {
          final value = _iconHaloColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        iconHaloWidth: _iconHaloWidth,
        iconHaloWidthTransition: () {
          final value = _iconHaloWidthTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        iconOpacity: _iconOpacity,
        iconOpacityTransition: () {
          final value = _iconOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        iconTranslate: _iconTranslate,
        iconTranslateAnchor: _iconTranslateAnchor,
        iconTranslateTransition: () {
          final value = _iconTranslateTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        textColor: _textColor,
        textColorTransition: () {
          final value = _textColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        textHaloBlur: _textHaloBlur,
        textHaloBlurTransition: () {
          final value = _textHaloBlurTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        textHaloColor: _textHaloColor,
        textHaloColorTransition: () {
          final value = _textHaloColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        textHaloWidth: _textHaloWidth,
        textHaloWidthTransition: () {
          final value = _textHaloWidthTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        textOpacity: _textOpacity,
        textOpacityTransition: () {
          final value = _textOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        textTranslate: _textTranslate,
        textTranslateAnchor: _textTranslateAnchor,
        textTranslateTransition: () {
          final value = _textTranslateTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
      );

  @override
  void freeze() {
    () {
      final value = _iconColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _iconHaloBlurTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _iconHaloColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _iconHaloWidthTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _iconOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _iconTranslateTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _textColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _textHaloBlurTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _textHaloColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _textHaloWidthTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _textOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _textTranslateTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_iconColor != null) 'icon-color': _iconColor!.value,
        if (_iconColorTransition != null)
          'icon-color-transition': _iconColorTransition!.toJson(),
        if (_iconHaloBlur != null) 'icon-halo-blur': _iconHaloBlur!.value,
        if (_iconHaloBlurTransition != null)
          'icon-halo-blur-transition': _iconHaloBlurTransition!.toJson(),
        if (_iconHaloColor != null) 'icon-halo-color': _iconHaloColor!.value,
        if (_iconHaloColorTransition != null)
          'icon-halo-color-transition': _iconHaloColorTransition!.toJson(),
        if (_iconHaloWidth != null) 'icon-halo-width': _iconHaloWidth!.value,
        if (_iconHaloWidthTransition != null)
          'icon-halo-width-transition': _iconHaloWidthTransition!.toJson(),
        if (_iconOpacity != null) 'icon-opacity': _iconOpacity!.value,
        if (_iconOpacityTransition != null)
          'icon-opacity-transition': _iconOpacityTransition!.toJson(),
        if (_iconTranslate != null) 'icon-translate': _iconTranslate!.value,
        if (_iconTranslateAnchor != null)
          'icon-translate-anchor': _iconTranslateAnchor!.value,
        if (_iconTranslateTransition != null)
          'icon-translate-transition': _iconTranslateTransition!.toJson(),
        if (_textColor != null) 'text-color': _textColor!.value,
        if (_textColorTransition != null)
          'text-color-transition': _textColorTransition!.toJson(),
        if (_textHaloBlur != null) 'text-halo-blur': _textHaloBlur!.value,
        if (_textHaloBlurTransition != null)
          'text-halo-blur-transition': _textHaloBlurTransition!.toJson(),
        if (_textHaloColor != null) 'text-halo-color': _textHaloColor!.value,
        if (_textHaloColorTransition != null)
          'text-halo-color-transition': _textHaloColorTransition!.toJson(),
        if (_textHaloWidth != null) 'text-halo-width': _textHaloWidth!.value,
        if (_textHaloWidthTransition != null)
          'text-halo-width-transition': _textHaloWidthTransition!.toJson(),
        if (_textOpacity != null) 'text-opacity': _textOpacity!.value,
        if (_textOpacityTransition != null)
          'text-opacity-transition': _textOpacityTransition!.toJson(),
        if (_textTranslate != null) 'text-translate': _textTranslate!.value,
        if (_textTranslateAnchor != null)
          'text-translate-anchor': _textTranslateAnchor!.value,
        if (_textTranslateTransition != null)
          'text-translate-transition': _textTranslateTransition!.toJson(),
      };

  static SymbolPaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = SymbolPaint();
    if (map.containsKey('icon-color')) {
      result._iconColor = _parseDataProperty(
        context,
        'icon-color',
        map.remove('icon-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-color-transition')) {
      result._iconColorTransition = _parseDataProperty(
        context,
        'icon-color-transition',
        map.remove('icon-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('icon-halo-blur')) {
      result._iconHaloBlur = _parseDataProperty(
        context,
        'icon-halo-blur',
        map.remove('icon-halo-blur'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-halo-blur-transition')) {
      result._iconHaloBlurTransition = _parseDataProperty(
        context,
        'icon-halo-blur-transition',
        map.remove('icon-halo-blur-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('icon-halo-color')) {
      result._iconHaloColor = _parseDataProperty(
        context,
        'icon-halo-color',
        map.remove('icon-halo-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-halo-color-transition')) {
      result._iconHaloColorTransition = _parseDataProperty(
        context,
        'icon-halo-color-transition',
        map.remove('icon-halo-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('icon-halo-width')) {
      result._iconHaloWidth = _parseDataProperty(
        context,
        'icon-halo-width',
        map.remove('icon-halo-width'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-halo-width-transition')) {
      result._iconHaloWidthTransition = _parseDataProperty(
        context,
        'icon-halo-width-transition',
        map.remove('icon-halo-width-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('icon-opacity')) {
      result._iconOpacity = _parseDataProperty(
        context,
        'icon-opacity',
        map.remove('icon-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-opacity-transition')) {
      result._iconOpacityTransition = _parseDataProperty(
        context,
        'icon-opacity-transition',
        map.remove('icon-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('icon-translate')) {
      result._iconTranslate = _parseDataProperty(
        context,
        'icon-translate',
        map.remove('icon-translate'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-translate-anchor')) {
      result._iconTranslateAnchor = _parseDataProperty(
        context,
        'icon-translate-anchor',
        map.remove('icon-translate-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('icon-translate-transition')) {
      result._iconTranslateTransition = _parseDataProperty(
        context,
        'icon-translate-transition',
        map.remove('icon-translate-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('text-color')) {
      result._textColor = _parseDataProperty(
        context,
        'text-color',
        map.remove('text-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-color-transition')) {
      result._textColorTransition = _parseDataProperty(
        context,
        'text-color-transition',
        map.remove('text-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('text-halo-blur')) {
      result._textHaloBlur = _parseDataProperty(
        context,
        'text-halo-blur',
        map.remove('text-halo-blur'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-halo-blur-transition')) {
      result._textHaloBlurTransition = _parseDataProperty(
        context,
        'text-halo-blur-transition',
        map.remove('text-halo-blur-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('text-halo-color')) {
      result._textHaloColor = _parseDataProperty(
        context,
        'text-halo-color',
        map.remove('text-halo-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-halo-color-transition')) {
      result._textHaloColorTransition = _parseDataProperty(
        context,
        'text-halo-color-transition',
        map.remove('text-halo-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('text-halo-width')) {
      result._textHaloWidth = _parseDataProperty(
        context,
        'text-halo-width',
        map.remove('text-halo-width'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-halo-width-transition')) {
      result._textHaloWidthTransition = _parseDataProperty(
        context,
        'text-halo-width-transition',
        map.remove('text-halo-width-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('text-opacity')) {
      result._textOpacity = _parseDataProperty(
        context,
        'text-opacity',
        map.remove('text-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-opacity-transition')) {
      result._textOpacityTransition = _parseDataProperty(
        context,
        'text-opacity-transition',
        map.remove('text-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('text-translate')) {
      result._textTranslate = _parseDataProperty(
        context,
        'text-translate',
        map.remove('text-translate'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-translate-anchor')) {
      result._textTranslateAnchor = _parseDataProperty(
        context,
        'text-translate-anchor',
        map.remove('text-translate-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('text-translate-transition')) {
      result._textTranslateTransition = _parseDataProperty(
        context,
        'text-translate-transition',
        map.remove('text-translate-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class RasterPaint extends PaintProperties {
  RasterPaint({
    Expression<num>? rasterBrightnessMax,
    Transition? rasterBrightnessMaxTransition,
    Expression<num>? rasterBrightnessMin,
    Transition? rasterBrightnessMinTransition,
    Expression<num>? rasterContrast,
    Transition? rasterContrastTransition,
    Expression<num>? rasterFadeDuration,
    Expression<num>? rasterHueRotate,
    Transition? rasterHueRotateTransition,
    Expression<num>? rasterOpacity,
    Transition? rasterOpacityTransition,
    Expression<RasterResampling>? rasterResampling,
    Expression<num>? rasterSaturation,
    Transition? rasterSaturationTransition,
  })  : _rasterBrightnessMax = rasterBrightnessMax,
        _rasterBrightnessMaxTransition = rasterBrightnessMaxTransition,
        _rasterBrightnessMin = rasterBrightnessMin,
        _rasterBrightnessMinTransition = rasterBrightnessMinTransition,
        _rasterContrast = rasterContrast,
        _rasterContrastTransition = rasterContrastTransition,
        _rasterFadeDuration = rasterFadeDuration,
        _rasterHueRotate = rasterHueRotate,
        _rasterHueRotateTransition = rasterHueRotateTransition,
        _rasterOpacity = rasterOpacity,
        _rasterOpacityTransition = rasterOpacityTransition,
        _rasterResampling = rasterResampling,
        _rasterSaturation = rasterSaturation,
        _rasterSaturationTransition = rasterSaturationTransition,
        super._();

  Expression<num>? get rasterBrightnessMax => _rasterBrightnessMax;
  Expression<num>? _rasterBrightnessMax;

  set rasterBrightnessMax(Expression<num>? value) {
    _checkNotFrozen();
    _rasterBrightnessMax = value;
  }

  Transition? get rasterBrightnessMaxTransition =>
      _rasterBrightnessMaxTransition;
  Transition? _rasterBrightnessMaxTransition;

  set rasterBrightnessMaxTransition(Transition? value) {
    _checkNotFrozen();
    _rasterBrightnessMaxTransition = value;
  }

  Expression<num>? get rasterBrightnessMin => _rasterBrightnessMin;
  Expression<num>? _rasterBrightnessMin;

  set rasterBrightnessMin(Expression<num>? value) {
    _checkNotFrozen();
    _rasterBrightnessMin = value;
  }

  Transition? get rasterBrightnessMinTransition =>
      _rasterBrightnessMinTransition;
  Transition? _rasterBrightnessMinTransition;

  set rasterBrightnessMinTransition(Transition? value) {
    _checkNotFrozen();
    _rasterBrightnessMinTransition = value;
  }

  Expression<num>? get rasterContrast => _rasterContrast;
  Expression<num>? _rasterContrast;

  set rasterContrast(Expression<num>? value) {
    _checkNotFrozen();
    _rasterContrast = value;
  }

  Transition? get rasterContrastTransition => _rasterContrastTransition;
  Transition? _rasterContrastTransition;

  set rasterContrastTransition(Transition? value) {
    _checkNotFrozen();
    _rasterContrastTransition = value;
  }

  Expression<num>? get rasterFadeDuration => _rasterFadeDuration;
  Expression<num>? _rasterFadeDuration;

  set rasterFadeDuration(Expression<num>? value) {
    _checkNotFrozen();
    _rasterFadeDuration = value;
  }

  Expression<num>? get rasterHueRotate => _rasterHueRotate;
  Expression<num>? _rasterHueRotate;

  set rasterHueRotate(Expression<num>? value) {
    _checkNotFrozen();
    _rasterHueRotate = value;
  }

  Transition? get rasterHueRotateTransition => _rasterHueRotateTransition;
  Transition? _rasterHueRotateTransition;

  set rasterHueRotateTransition(Transition? value) {
    _checkNotFrozen();
    _rasterHueRotateTransition = value;
  }

  Expression<num>? get rasterOpacity => _rasterOpacity;
  Expression<num>? _rasterOpacity;

  set rasterOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _rasterOpacity = value;
  }

  Transition? get rasterOpacityTransition => _rasterOpacityTransition;
  Transition? _rasterOpacityTransition;

  set rasterOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _rasterOpacityTransition = value;
  }

  Expression<RasterResampling>? get rasterResampling => _rasterResampling;
  Expression<RasterResampling>? _rasterResampling;

  set rasterResampling(Expression<RasterResampling>? value) {
    _checkNotFrozen();
    _rasterResampling = value;
  }

  Expression<num>? get rasterSaturation => _rasterSaturation;
  Expression<num>? _rasterSaturation;

  set rasterSaturation(Expression<num>? value) {
    _checkNotFrozen();
    _rasterSaturation = value;
  }

  Transition? get rasterSaturationTransition => _rasterSaturationTransition;
  Transition? _rasterSaturationTransition;

  set rasterSaturationTransition(Transition? value) {
    _checkNotFrozen();
    _rasterSaturationTransition = value;
  }

  @override
  RasterPaint copy() => RasterPaint(
        rasterBrightnessMax: _rasterBrightnessMax,
        rasterBrightnessMaxTransition: () {
          final value = _rasterBrightnessMaxTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        rasterBrightnessMin: _rasterBrightnessMin,
        rasterBrightnessMinTransition: () {
          final value = _rasterBrightnessMinTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        rasterContrast: _rasterContrast,
        rasterContrastTransition: () {
          final value = _rasterContrastTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        rasterFadeDuration: _rasterFadeDuration,
        rasterHueRotate: _rasterHueRotate,
        rasterHueRotateTransition: () {
          final value = _rasterHueRotateTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        rasterOpacity: _rasterOpacity,
        rasterOpacityTransition: () {
          final value = _rasterOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        rasterResampling: _rasterResampling,
        rasterSaturation: _rasterSaturation,
        rasterSaturationTransition: () {
          final value = _rasterSaturationTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
      );

  @override
  void freeze() {
    () {
      final value = _rasterBrightnessMaxTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _rasterBrightnessMinTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _rasterContrastTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _rasterHueRotateTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _rasterOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _rasterSaturationTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_rasterBrightnessMax != null)
          'raster-brightness-max': _rasterBrightnessMax!.value,
        if (_rasterBrightnessMaxTransition != null)
          'raster-brightness-max-transition':
              _rasterBrightnessMaxTransition!.toJson(),
        if (_rasterBrightnessMin != null)
          'raster-brightness-min': _rasterBrightnessMin!.value,
        if (_rasterBrightnessMinTransition != null)
          'raster-brightness-min-transition':
              _rasterBrightnessMinTransition!.toJson(),
        if (_rasterContrast != null) 'raster-contrast': _rasterContrast!.value,
        if (_rasterContrastTransition != null)
          'raster-contrast-transition': _rasterContrastTransition!.toJson(),
        if (_rasterFadeDuration != null)
          'raster-fade-duration': _rasterFadeDuration!.value,
        if (_rasterHueRotate != null)
          'raster-hue-rotate': _rasterHueRotate!.value,
        if (_rasterHueRotateTransition != null)
          'raster-hue-rotate-transition': _rasterHueRotateTransition!.toJson(),
        if (_rasterOpacity != null) 'raster-opacity': _rasterOpacity!.value,
        if (_rasterOpacityTransition != null)
          'raster-opacity-transition': _rasterOpacityTransition!.toJson(),
        if (_rasterResampling != null)
          'raster-resampling': _rasterResampling!.value,
        if (_rasterSaturation != null)
          'raster-saturation': _rasterSaturation!.value,
        if (_rasterSaturationTransition != null)
          'raster-saturation-transition': _rasterSaturationTransition!.toJson(),
      };

  static RasterPaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = RasterPaint();
    if (map.containsKey('raster-brightness-max')) {
      result._rasterBrightnessMax = _parseDataProperty(
        context,
        'raster-brightness-max',
        map.remove('raster-brightness-max'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('raster-brightness-max-transition')) {
      result._rasterBrightnessMaxTransition = _parseDataProperty(
        context,
        'raster-brightness-max-transition',
        map.remove('raster-brightness-max-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('raster-brightness-min')) {
      result._rasterBrightnessMin = _parseDataProperty(
        context,
        'raster-brightness-min',
        map.remove('raster-brightness-min'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('raster-brightness-min-transition')) {
      result._rasterBrightnessMinTransition = _parseDataProperty(
        context,
        'raster-brightness-min-transition',
        map.remove('raster-brightness-min-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('raster-contrast')) {
      result._rasterContrast = _parseDataProperty(
        context,
        'raster-contrast',
        map.remove('raster-contrast'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('raster-contrast-transition')) {
      result._rasterContrastTransition = _parseDataProperty(
        context,
        'raster-contrast-transition',
        map.remove('raster-contrast-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('raster-fade-duration')) {
      result._rasterFadeDuration = _parseDataProperty(
        context,
        'raster-fade-duration',
        map.remove('raster-fade-duration'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('raster-hue-rotate')) {
      result._rasterHueRotate = _parseDataProperty(
        context,
        'raster-hue-rotate',
        map.remove('raster-hue-rotate'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('raster-hue-rotate-transition')) {
      result._rasterHueRotateTransition = _parseDataProperty(
        context,
        'raster-hue-rotate-transition',
        map.remove('raster-hue-rotate-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('raster-opacity')) {
      result._rasterOpacity = _parseDataProperty(
        context,
        'raster-opacity',
        map.remove('raster-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('raster-opacity-transition')) {
      result._rasterOpacityTransition = _parseDataProperty(
        context,
        'raster-opacity-transition',
        map.remove('raster-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('raster-resampling')) {
      result._rasterResampling = _parseDataProperty(
        context,
        'raster-resampling',
        map.remove('raster-resampling'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('raster-saturation')) {
      result._rasterSaturation = _parseDataProperty(
        context,
        'raster-saturation',
        map.remove('raster-saturation'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('raster-saturation-transition')) {
      result._rasterSaturationTransition = _parseDataProperty(
        context,
        'raster-saturation-transition',
        map.remove('raster-saturation-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class HillshadePaint extends PaintProperties {
  HillshadePaint({
    Expression<Color>? hillshadeAccentColor,
    Transition? hillshadeAccentColorTransition,
    Expression<num>? hillshadeExaggeration,
    Transition? hillshadeExaggerationTransition,
    Expression<Color>? hillshadeHighlightColor,
    Transition? hillshadeHighlightColorTransition,
    Expression<HillshadeIlluminationAnchor>? hillshadeIlluminationAnchor,
    Expression<num>? hillshadeIlluminationDirection,
    Expression<Color>? hillshadeShadowColor,
    Transition? hillshadeShadowColorTransition,
  })  : _hillshadeAccentColor = hillshadeAccentColor,
        _hillshadeAccentColorTransition = hillshadeAccentColorTransition,
        _hillshadeExaggeration = hillshadeExaggeration,
        _hillshadeExaggerationTransition = hillshadeExaggerationTransition,
        _hillshadeHighlightColor = hillshadeHighlightColor,
        _hillshadeHighlightColorTransition = hillshadeHighlightColorTransition,
        _hillshadeIlluminationAnchor = hillshadeIlluminationAnchor,
        _hillshadeIlluminationDirection = hillshadeIlluminationDirection,
        _hillshadeShadowColor = hillshadeShadowColor,
        _hillshadeShadowColorTransition = hillshadeShadowColorTransition,
        super._();

  Expression<Color>? get hillshadeAccentColor => _hillshadeAccentColor;
  Expression<Color>? _hillshadeAccentColor;

  set hillshadeAccentColor(Expression<Color>? value) {
    _checkNotFrozen();
    _hillshadeAccentColor = value;
  }

  Transition? get hillshadeAccentColorTransition =>
      _hillshadeAccentColorTransition;
  Transition? _hillshadeAccentColorTransition;

  set hillshadeAccentColorTransition(Transition? value) {
    _checkNotFrozen();
    _hillshadeAccentColorTransition = value;
  }

  Expression<num>? get hillshadeExaggeration => _hillshadeExaggeration;
  Expression<num>? _hillshadeExaggeration;

  set hillshadeExaggeration(Expression<num>? value) {
    _checkNotFrozen();
    _hillshadeExaggeration = value;
  }

  Transition? get hillshadeExaggerationTransition =>
      _hillshadeExaggerationTransition;
  Transition? _hillshadeExaggerationTransition;

  set hillshadeExaggerationTransition(Transition? value) {
    _checkNotFrozen();
    _hillshadeExaggerationTransition = value;
  }

  Expression<Color>? get hillshadeHighlightColor => _hillshadeHighlightColor;
  Expression<Color>? _hillshadeHighlightColor;

  set hillshadeHighlightColor(Expression<Color>? value) {
    _checkNotFrozen();
    _hillshadeHighlightColor = value;
  }

  Transition? get hillshadeHighlightColorTransition =>
      _hillshadeHighlightColorTransition;
  Transition? _hillshadeHighlightColorTransition;

  set hillshadeHighlightColorTransition(Transition? value) {
    _checkNotFrozen();
    _hillshadeHighlightColorTransition = value;
  }

  Expression<HillshadeIlluminationAnchor>? get hillshadeIlluminationAnchor =>
      _hillshadeIlluminationAnchor;
  Expression<HillshadeIlluminationAnchor>? _hillshadeIlluminationAnchor;

  set hillshadeIlluminationAnchor(
      Expression<HillshadeIlluminationAnchor>? value) {
    _checkNotFrozen();
    _hillshadeIlluminationAnchor = value;
  }

  Expression<num>? get hillshadeIlluminationDirection =>
      _hillshadeIlluminationDirection;
  Expression<num>? _hillshadeIlluminationDirection;

  set hillshadeIlluminationDirection(Expression<num>? value) {
    _checkNotFrozen();
    _hillshadeIlluminationDirection = value;
  }

  Expression<Color>? get hillshadeShadowColor => _hillshadeShadowColor;
  Expression<Color>? _hillshadeShadowColor;

  set hillshadeShadowColor(Expression<Color>? value) {
    _checkNotFrozen();
    _hillshadeShadowColor = value;
  }

  Transition? get hillshadeShadowColorTransition =>
      _hillshadeShadowColorTransition;
  Transition? _hillshadeShadowColorTransition;

  set hillshadeShadowColorTransition(Transition? value) {
    _checkNotFrozen();
    _hillshadeShadowColorTransition = value;
  }

  @override
  HillshadePaint copy() => HillshadePaint(
        hillshadeAccentColor: _hillshadeAccentColor,
        hillshadeAccentColorTransition: () {
          final value = _hillshadeAccentColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        hillshadeExaggeration: _hillshadeExaggeration,
        hillshadeExaggerationTransition: () {
          final value = _hillshadeExaggerationTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        hillshadeHighlightColor: _hillshadeHighlightColor,
        hillshadeHighlightColorTransition: () {
          final value = _hillshadeHighlightColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        hillshadeIlluminationAnchor: _hillshadeIlluminationAnchor,
        hillshadeIlluminationDirection: _hillshadeIlluminationDirection,
        hillshadeShadowColor: _hillshadeShadowColor,
        hillshadeShadowColorTransition: () {
          final value = _hillshadeShadowColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
      );

  @override
  void freeze() {
    () {
      final value = _hillshadeAccentColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _hillshadeExaggerationTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _hillshadeHighlightColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _hillshadeShadowColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_hillshadeAccentColor != null)
          'hillshade-accent-color': _hillshadeAccentColor!.value,
        if (_hillshadeAccentColorTransition != null)
          'hillshade-accent-color-transition':
              _hillshadeAccentColorTransition!.toJson(),
        if (_hillshadeExaggeration != null)
          'hillshade-exaggeration': _hillshadeExaggeration!.value,
        if (_hillshadeExaggerationTransition != null)
          'hillshade-exaggeration-transition':
              _hillshadeExaggerationTransition!.toJson(),
        if (_hillshadeHighlightColor != null)
          'hillshade-highlight-color': _hillshadeHighlightColor!.value,
        if (_hillshadeHighlightColorTransition != null)
          'hillshade-highlight-color-transition':
              _hillshadeHighlightColorTransition!.toJson(),
        if (_hillshadeIlluminationAnchor != null)
          'hillshade-illumination-anchor': _hillshadeIlluminationAnchor!.value,
        if (_hillshadeIlluminationDirection != null)
          'hillshade-illumination-direction':
              _hillshadeIlluminationDirection!.value,
        if (_hillshadeShadowColor != null)
          'hillshade-shadow-color': _hillshadeShadowColor!.value,
        if (_hillshadeShadowColorTransition != null)
          'hillshade-shadow-color-transition':
              _hillshadeShadowColorTransition!.toJson(),
      };

  static HillshadePaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = HillshadePaint();
    if (map.containsKey('hillshade-accent-color')) {
      result._hillshadeAccentColor = _parseDataProperty(
        context,
        'hillshade-accent-color',
        map.remove('hillshade-accent-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('hillshade-accent-color-transition')) {
      result._hillshadeAccentColorTransition = _parseDataProperty(
        context,
        'hillshade-accent-color-transition',
        map.remove('hillshade-accent-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('hillshade-exaggeration')) {
      result._hillshadeExaggeration = _parseDataProperty(
        context,
        'hillshade-exaggeration',
        map.remove('hillshade-exaggeration'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('hillshade-exaggeration-transition')) {
      result._hillshadeExaggerationTransition = _parseDataProperty(
        context,
        'hillshade-exaggeration-transition',
        map.remove('hillshade-exaggeration-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('hillshade-highlight-color')) {
      result._hillshadeHighlightColor = _parseDataProperty(
        context,
        'hillshade-highlight-color',
        map.remove('hillshade-highlight-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('hillshade-highlight-color-transition')) {
      result._hillshadeHighlightColorTransition = _parseDataProperty(
        context,
        'hillshade-highlight-color-transition',
        map.remove('hillshade-highlight-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('hillshade-illumination-anchor')) {
      result._hillshadeIlluminationAnchor = _parseDataProperty(
        context,
        'hillshade-illumination-anchor',
        map.remove('hillshade-illumination-anchor'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('hillshade-illumination-direction')) {
      result._hillshadeIlluminationDirection = _parseDataProperty(
        context,
        'hillshade-illumination-direction',
        map.remove('hillshade-illumination-direction'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('hillshade-shadow-color')) {
      result._hillshadeShadowColor = _parseDataProperty(
        context,
        'hillshade-shadow-color',
        map.remove('hillshade-shadow-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('hillshade-shadow-color-transition')) {
      result._hillshadeShadowColorTransition = _parseDataProperty(
        context,
        'hillshade-shadow-color-transition',
        map.remove('hillshade-shadow-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class BackgroundPaint extends PaintProperties {
  BackgroundPaint({
    Expression<Color>? backgroundColor,
    Transition? backgroundColorTransition,
    Expression<num>? backgroundOpacity,
    Transition? backgroundOpacityTransition,
    Expression<ResolvedImage>? backgroundPattern,
    Transition? backgroundPatternTransition,
  })  : _backgroundColor = backgroundColor,
        _backgroundColorTransition = backgroundColorTransition,
        _backgroundOpacity = backgroundOpacity,
        _backgroundOpacityTransition = backgroundOpacityTransition,
        _backgroundPattern = backgroundPattern,
        _backgroundPatternTransition = backgroundPatternTransition,
        super._();

  Expression<Color>? get backgroundColor => _backgroundColor;
  Expression<Color>? _backgroundColor;

  set backgroundColor(Expression<Color>? value) {
    _checkNotFrozen();
    _backgroundColor = value;
  }

  Transition? get backgroundColorTransition => _backgroundColorTransition;
  Transition? _backgroundColorTransition;

  set backgroundColorTransition(Transition? value) {
    _checkNotFrozen();
    _backgroundColorTransition = value;
  }

  Expression<num>? get backgroundOpacity => _backgroundOpacity;
  Expression<num>? _backgroundOpacity;

  set backgroundOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _backgroundOpacity = value;
  }

  Transition? get backgroundOpacityTransition => _backgroundOpacityTransition;
  Transition? _backgroundOpacityTransition;

  set backgroundOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _backgroundOpacityTransition = value;
  }

  Expression<ResolvedImage>? get backgroundPattern => _backgroundPattern;
  Expression<ResolvedImage>? _backgroundPattern;

  set backgroundPattern(Expression<ResolvedImage>? value) {
    _checkNotFrozen();
    _backgroundPattern = value;
  }

  Transition? get backgroundPatternTransition => _backgroundPatternTransition;
  Transition? _backgroundPatternTransition;

  set backgroundPatternTransition(Transition? value) {
    _checkNotFrozen();
    _backgroundPatternTransition = value;
  }

  @override
  BackgroundPaint copy() => BackgroundPaint(
        backgroundColor: _backgroundColor,
        backgroundColorTransition: () {
          final value = _backgroundColorTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        backgroundOpacity: _backgroundOpacity,
        backgroundOpacityTransition: () {
          final value = _backgroundOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        backgroundPattern: _backgroundPattern,
        backgroundPatternTransition: () {
          final value = _backgroundPatternTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
      );

  @override
  void freeze() {
    () {
      final value = _backgroundColorTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _backgroundOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _backgroundPatternTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_backgroundColor != null)
          'background-color': _backgroundColor!.value,
        if (_backgroundColorTransition != null)
          'background-color-transition': _backgroundColorTransition!.toJson(),
        if (_backgroundOpacity != null)
          'background-opacity': _backgroundOpacity!.value,
        if (_backgroundOpacityTransition != null)
          'background-opacity-transition':
              _backgroundOpacityTransition!.toJson(),
        if (_backgroundPattern != null)
          'background-pattern': _backgroundPattern!.value,
        if (_backgroundPatternTransition != null)
          'background-pattern-transition':
              _backgroundPatternTransition!.toJson(),
      };

  static BackgroundPaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = BackgroundPaint();
    if (map.containsKey('background-color')) {
      result._backgroundColor = _parseDataProperty(
        context,
        'background-color',
        map.remove('background-color'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('background-color-transition')) {
      result._backgroundColorTransition = _parseDataProperty(
        context,
        'background-color-transition',
        map.remove('background-color-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('background-opacity')) {
      result._backgroundOpacity = _parseDataProperty(
        context,
        'background-opacity',
        map.remove('background-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('background-opacity-transition')) {
      result._backgroundOpacityTransition = _parseDataProperty(
        context,
        'background-opacity-transition',
        map.remove('background-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('background-pattern')) {
      result._backgroundPattern = _parseDataProperty(
        context,
        'background-pattern',
        map.remove('background-pattern'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('background-pattern-transition')) {
      result._backgroundPatternTransition = _parseDataProperty(
        context,
        'background-pattern-transition',
        map.remove('background-pattern-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class SkyPaint extends PaintProperties {
  SkyPaint({
    Color? skyAtmosphereColor,
    Color? skyAtmosphereHaloColor,
    Expression<List<num>>? skyAtmosphereSun,
    num? skyAtmosphereSunIntensity,
    Expression<Color>? skyGradient,
    Expression<List<num>>? skyGradientCenter,
    Expression<num>? skyGradientRadius,
    Expression<num>? skyOpacity,
    Transition? skyOpacityTransition,
    Expression<SkyType>? skyType,
  })  : _skyAtmosphereColor = skyAtmosphereColor,
        _skyAtmosphereHaloColor = skyAtmosphereHaloColor,
        _skyAtmosphereSun = skyAtmosphereSun,
        _skyAtmosphereSunIntensity = skyAtmosphereSunIntensity,
        _skyGradient = skyGradient,
        _skyGradientCenter = skyGradientCenter,
        _skyGradientRadius = skyGradientRadius,
        _skyOpacity = skyOpacity,
        _skyOpacityTransition = skyOpacityTransition,
        _skyType = skyType,
        super._();

  Color? get skyAtmosphereColor => _skyAtmosphereColor;
  Color? _skyAtmosphereColor;

  set skyAtmosphereColor(Color? value) {
    _checkNotFrozen();
    _skyAtmosphereColor = value;
  }

  Color? get skyAtmosphereHaloColor => _skyAtmosphereHaloColor;
  Color? _skyAtmosphereHaloColor;

  set skyAtmosphereHaloColor(Color? value) {
    _checkNotFrozen();
    _skyAtmosphereHaloColor = value;
  }

  Expression<List<num>>? get skyAtmosphereSun => _skyAtmosphereSun;
  Expression<List<num>>? _skyAtmosphereSun;

  set skyAtmosphereSun(Expression<List<num>>? value) {
    _checkNotFrozen();
    _skyAtmosphereSun = value;
  }

  num? get skyAtmosphereSunIntensity => _skyAtmosphereSunIntensity;
  num? _skyAtmosphereSunIntensity;

  set skyAtmosphereSunIntensity(num? value) {
    _checkNotFrozen();
    _skyAtmosphereSunIntensity = value;
  }

  Expression<Color>? get skyGradient => _skyGradient;
  Expression<Color>? _skyGradient;

  set skyGradient(Expression<Color>? value) {
    _checkNotFrozen();
    _skyGradient = value;
  }

  Expression<List<num>>? get skyGradientCenter => _skyGradientCenter;
  Expression<List<num>>? _skyGradientCenter;

  set skyGradientCenter(Expression<List<num>>? value) {
    _checkNotFrozen();
    _skyGradientCenter = value;
  }

  Expression<num>? get skyGradientRadius => _skyGradientRadius;
  Expression<num>? _skyGradientRadius;

  set skyGradientRadius(Expression<num>? value) {
    _checkNotFrozen();
    _skyGradientRadius = value;
  }

  Expression<num>? get skyOpacity => _skyOpacity;
  Expression<num>? _skyOpacity;

  set skyOpacity(Expression<num>? value) {
    _checkNotFrozen();
    _skyOpacity = value;
  }

  Transition? get skyOpacityTransition => _skyOpacityTransition;
  Transition? _skyOpacityTransition;

  set skyOpacityTransition(Transition? value) {
    _checkNotFrozen();
    _skyOpacityTransition = value;
  }

  Expression<SkyType>? get skyType => _skyType;
  Expression<SkyType>? _skyType;

  set skyType(Expression<SkyType>? value) {
    _checkNotFrozen();
    _skyType = value;
  }

  @override
  SkyPaint copy() => SkyPaint(
        skyAtmosphereColor: _skyAtmosphereColor,
        skyAtmosphereHaloColor: _skyAtmosphereHaloColor,
        skyAtmosphereSun: _skyAtmosphereSun,
        skyAtmosphereSunIntensity: _skyAtmosphereSunIntensity,
        skyGradient: _skyGradient,
        skyGradientCenter: _skyGradientCenter,
        skyGradientRadius: _skyGradientRadius,
        skyOpacity: _skyOpacity,
        skyOpacityTransition: () {
          final value = _skyOpacityTransition;
          if (value != null) {
            return value.copy();
          }
        }(),
        skyType: _skyType,
      );

  @override
  void freeze() {
    () {
      final value = _skyOpacityTransition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_skyAtmosphereColor != null)
          'sky-atmosphere-color': _skyAtmosphereColor!.toString(),
        if (_skyAtmosphereHaloColor != null)
          'sky-atmosphere-halo-color': _skyAtmosphereHaloColor!.toString(),
        if (_skyAtmosphereSun != null)
          'sky-atmosphere-sun': _skyAtmosphereSun!.value,
        if (_skyAtmosphereSunIntensity != null)
          'sky-atmosphere-sun-intensity': _skyAtmosphereSunIntensity!,
        if (_skyGradient != null) 'sky-gradient': _skyGradient!.value,
        if (_skyGradientCenter != null)
          'sky-gradient-center': _skyGradientCenter!.value,
        if (_skyGradientRadius != null)
          'sky-gradient-radius': _skyGradientRadius!.value,
        if (_skyOpacity != null) 'sky-opacity': _skyOpacity!.value,
        if (_skyOpacityTransition != null)
          'sky-opacity-transition': _skyOpacityTransition!.toJson(),
        if (_skyType != null) 'sky-type': _skyType!.value,
      };

  static SkyPaint? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = SkyPaint();
    if (map.containsKey('sky-atmosphere-color')) {
      result._skyAtmosphereColor = _parseDataProperty(
        context,
        'sky-atmosphere-color',
        map.remove('sky-atmosphere-color'),
        (context) => Color.fromJson(context),
      );
    }
    if (map.containsKey('sky-atmosphere-halo-color')) {
      result._skyAtmosphereHaloColor = _parseDataProperty(
        context,
        'sky-atmosphere-halo-color',
        map.remove('sky-atmosphere-halo-color'),
        (context) => Color.fromJson(context),
      );
    }
    if (map.containsKey('sky-atmosphere-sun')) {
      result._skyAtmosphereSun = _parseDataProperty(
        context,
        'sky-atmosphere-sun',
        map.remove('sky-atmosphere-sun'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('sky-atmosphere-sun-intensity')) {
      result._skyAtmosphereSunIntensity = _parseDataProperty(
        context,
        'sky-atmosphere-sun-intensity',
        map.remove('sky-atmosphere-sun-intensity'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('sky-gradient')) {
      result._skyGradient = _parseDataProperty(
        context,
        'sky-gradient',
        map.remove('sky-gradient'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('sky-gradient-center')) {
      result._skyGradientCenter = _parseDataProperty(
        context,
        'sky-gradient-center',
        map.remove('sky-gradient-center'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('sky-gradient-radius')) {
      result._skyGradientRadius = _parseDataProperty(
        context,
        'sky-gradient-radius',
        map.remove('sky-gradient-radius'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('sky-opacity')) {
      result._skyOpacity = _parseDataProperty(
        context,
        'sky-opacity',
        map.remove('sky-opacity'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('sky-opacity-transition')) {
      result._skyOpacityTransition = _parseDataProperty(
        context,
        'sky-opacity-transition',
        map.remove('sky-opacity-transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('sky-type')) {
      result._skyType = _parseDataProperty(
        context,
        'sky-type',
        map.remove('sky-type'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

abstract class Layer<Layout extends LayoutProperties,
    Paint extends PaintProperties> with DataMixin {
  Layer._({
    Expression<bool>? filter,
    String? id,
    Layout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    Paint? paint,
    String? source,
    String? sourceLayer,
    required LayerType type,
  })  : _filter = filter,
        _id = id,
        _layout = layout,
        _maxzoom = maxzoom,
        _metadata = metadata,
        _minzoom = minzoom,
        _paint = paint,
        _source = source,
        _sourceLayer = sourceLayer,
        _type = type;

  Expression<bool>? get filter => _filter;
  Expression<bool>? _filter;

  set filter(Expression<bool>? value) {
    _checkNotFrozen();
    _filter = value;
  }

  String? get id => _id;
  String? _id;

  set id(String? value) {
    _checkNotFrozen();
    _id = value;
  }

  Layout? get layout => _layout;
  Layout? _layout;

  set layout(Layout? value) {
    _checkNotFrozen();
    _layout = value;
  }

  num? get maxzoom => _maxzoom;
  num? _maxzoom;

  set maxzoom(num? value) {
    _checkNotFrozen();
    _maxzoom = value;
  }

  Map<String, Object?>? get metadata => _metadata;
  Map<String, Object?>? _metadata;

  set metadata(Map<String, Object?>? value) {
    _checkNotFrozen();
    _metadata = value;
  }

  num? get minzoom => _minzoom;
  num? _minzoom;

  set minzoom(num? value) {
    _checkNotFrozen();
    _minzoom = value;
  }

  Paint? get paint => _paint;
  Paint? _paint;

  set paint(Paint? value) {
    _checkNotFrozen();
    _paint = value;
  }

  String? get source => _source;
  String? _source;

  set source(String? value) {
    _checkNotFrozen();
    _source = value;
  }

  String? get sourceLayer => _sourceLayer;
  String? _sourceLayer;

  set sourceLayer(String? value) {
    _checkNotFrozen();
    _sourceLayer = value;
  }

  LayerType get type => _type;
  final LayerType _type;

  @override
  Layer copy();

  static Layer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final type = value['type'];
    switch (type) {
      case 'fill':
        return FillLayer.fromJson(context);
      case 'line':
        return LineLayer.fromJson(context);
      case 'symbol':
        return SymbolLayer.fromJson(context);
      case 'circle':
        return CircleLayer.fromJson(context);
      case 'heatmap':
        return HeatmapLayer.fromJson(context);
      case 'fill-extrusion':
        return FillExtrusionLayer.fromJson(context);
      case 'raster':
        return RasterLayer.fromJson(context);
      case 'hillshade':
        return HillshadeLayer.fromJson(context);
      case 'background':
        return BackgroundLayer.fromJson(context);
      case 'sky':
        return SkyLayer.fromJson(context);
      default:
        context._recordException(
          DataException('Unable to parse value.'),
        );
        DataContext.child(parent: context, key: 'type', value: type)
            ._recordException(
          DataException('Unknown value for type discriminator'),
        );
    }
  }
}

class FillLayer extends Layer<FillLayout, FillPaint> {
  FillLayer({
    Expression<bool>? filter,
    String? id,
    FillLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    FillPaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.fill,
        );

  @override
  FillLayer copy() => FillLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static FillLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = FillLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => FillLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => FillPaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'fill';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class LineLayer extends Layer<LineLayout, LinePaint> {
  LineLayer({
    Expression<bool>? filter,
    String? id,
    LineLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    LinePaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.line,
        );

  @override
  LineLayer copy() => LineLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static LineLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = LineLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => LineLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => LinePaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'line';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class SymbolLayer extends Layer<SymbolLayout, SymbolPaint> {
  SymbolLayer({
    Expression<bool>? filter,
    String? id,
    SymbolLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    SymbolPaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.symbol,
        );

  @override
  SymbolLayer copy() => SymbolLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static SymbolLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = SymbolLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => SymbolLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => SymbolPaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'symbol';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class CircleLayer extends Layer<CircleLayout, CirclePaint> {
  CircleLayer({
    Expression<bool>? filter,
    String? id,
    CircleLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    CirclePaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.circle,
        );

  @override
  CircleLayer copy() => CircleLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static CircleLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = CircleLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => CircleLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => CirclePaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'circle';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class HeatmapLayer extends Layer<HeatmapLayout, HeatmapPaint> {
  HeatmapLayer({
    Expression<bool>? filter,
    String? id,
    HeatmapLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    HeatmapPaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.heatmap,
        );

  @override
  HeatmapLayer copy() => HeatmapLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static HeatmapLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = HeatmapLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => HeatmapLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => HeatmapPaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'heatmap';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class FillExtrusionLayer
    extends Layer<FillExtrusionLayout, FillExtrusionPaint> {
  FillExtrusionLayer({
    Expression<bool>? filter,
    String? id,
    FillExtrusionLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    FillExtrusionPaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.fillExtrusion,
        );

  @override
  FillExtrusionLayer copy() => FillExtrusionLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static FillExtrusionLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = FillExtrusionLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => FillExtrusionLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => FillExtrusionPaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'fillExtrusion';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class RasterLayer extends Layer<RasterLayout, RasterPaint> {
  RasterLayer({
    Expression<bool>? filter,
    String? id,
    RasterLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    RasterPaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.raster,
        );

  @override
  RasterLayer copy() => RasterLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static RasterLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = RasterLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => RasterLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => RasterPaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'raster';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class HillshadeLayer extends Layer<HillshadeLayout, HillshadePaint> {
  HillshadeLayer({
    Expression<bool>? filter,
    String? id,
    HillshadeLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    HillshadePaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.hillshade,
        );

  @override
  HillshadeLayer copy() => HillshadeLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static HillshadeLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = HillshadeLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => HillshadeLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => HillshadePaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'hillshade';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class BackgroundLayer extends Layer<BackgroundLayout, BackgroundPaint> {
  BackgroundLayer({
    Expression<bool>? filter,
    String? id,
    BackgroundLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    BackgroundPaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.background,
        );

  @override
  BackgroundLayer copy() => BackgroundLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static BackgroundLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = BackgroundLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => BackgroundLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => BackgroundPaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'background';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class SkyLayer extends Layer<SkyLayout, SkyPaint> {
  SkyLayer({
    Expression<bool>? filter,
    String? id,
    SkyLayout? layout,
    num? maxzoom,
    Map<String, Object?>? metadata,
    num? minzoom,
    SkyPaint? paint,
    String? source,
    String? sourceLayer,
  }) : super._(
          filter: filter,
          id: id,
          layout: layout,
          maxzoom: maxzoom,
          metadata: metadata,
          minzoom: minzoom,
          paint: paint,
          source: source,
          sourceLayer: sourceLayer,
          type: LayerType.sky,
        );

  @override
  SkyLayer copy() => SkyLayer(
        filter: _filter,
        id: _id,
        layout: () {
          final value = _layout;
          if (value != null) {
            return value.copy();
          }
        }(),
        maxzoom: _maxzoom,
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        minzoom: _minzoom,
        paint: () {
          final value = _paint;
          if (value != null) {
            return value.copy();
          }
        }(),
        source: _source,
        sourceLayer: _sourceLayer,
      );

  @override
  void freeze() {
    () {
      final value = _layout;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _paint;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_filter != null) 'filter': _filter!.value,
        if (_id != null) 'id': _id!,
        if (_layout != null) 'layout': _layout!.toJson(),
        if (_maxzoom != null) 'maxzoom': _maxzoom!,
        if (_metadata != null) 'metadata': _metadata!,
        if (_minzoom != null) 'minzoom': _minzoom!,
        if (_paint != null) 'paint': _paint!.toJson(),
        if (_source != null) 'source': _source!,
        if (_sourceLayer != null) 'source-layer': _sourceLayer!,
        'type': _type.toJson(),
      };

  static SkyLayer? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = SkyLayer();
    if (map.containsKey('filter')) {
      result._filter = _parseDataProperty(
        context,
        'filter',
        map.remove('filter'),
        (context) => Expression.fromJson(context),
      );
    }
    if (map.containsKey('id')) {
      result._id = _parseDataProperty(
        context,
        'id',
        map.remove('id'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layout')) {
      result._layout = _parseDataProperty(
        context,
        'layout',
        map.remove('layout'),
        (context) => SkyLayout.fromJson(context),
      );
    }
    if (map.containsKey('maxzoom')) {
      result._maxzoom = _parseDataProperty(
        context,
        'maxzoom',
        map.remove('maxzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('minzoom')) {
      result._minzoom = _parseDataProperty(
        context,
        'minzoom',
        map.remove('minzoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('paint')) {
      result._paint = _parseDataProperty(
        context,
        'paint',
        map.remove('paint'),
        (context) => SkyPaint.fromJson(context),
      );
    }
    if (map.containsKey('source')) {
      result._source = _parseDataProperty(
        context,
        'source',
        map.remove('source'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('source-layer')) {
      result._sourceLayer = _parseDataProperty(
        context,
        'source-layer',
        map.remove('source-layer'),
        (context) => _parseAsType<String>(context),
      );
    }
    const typeKey = 'type';
    const expectedType = 'sky';
    final type = map.remove(typeKey);
    if (type != expectedType) {
      DataContext.child(parent: context, key: typeKey, value: type)
          ._recordException(
        DataException(
          'Unexpected $expectedType for type discriminator but got $type',
        ),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}

class Style with DataMixin {
  Style({
    num? bearing,
    List<num>? center,
    Fog? fog,
    String? glyphs,
    List<Layer>? layers,
    Light? light,
    Map<String, Object?>? metadata,
    String? name,
    num? pitch,
    Projection? projection,
    Sources? sources,
    String? sprite,
    Terrain? terrain,
    Transition? transition,
    Version? version,
    num? zoom,
  })  : _bearing = bearing,
        _center = center,
        _fog = fog,
        _glyphs = glyphs,
        _layers = layers,
        _light = light,
        _metadata = metadata,
        _name = name,
        _pitch = pitch,
        _projection = projection,
        _sources = sources,
        _sprite = sprite,
        _terrain = terrain,
        _transition = transition,
        _version = version,
        _zoom = zoom;

  num? get bearing => _bearing;
  num? _bearing;

  set bearing(num? value) {
    _checkNotFrozen();
    _bearing = value;
  }

  List<num>? get center => _center;
  List<num>? _center;

  set center(List<num>? value) {
    _checkNotFrozen();
    _center = value;
  }

  Fog? get fog => _fog;
  Fog? _fog;

  set fog(Fog? value) {
    _checkNotFrozen();
    _fog = value;
  }

  String? get glyphs => _glyphs;
  String? _glyphs;

  set glyphs(String? value) {
    _checkNotFrozen();
    _glyphs = value;
  }

  List<Layer>? get layers => _layers;
  List<Layer>? _layers;

  set layers(List<Layer>? value) {
    _checkNotFrozen();
    _layers = value;
  }

  Light? get light => _light;
  Light? _light;

  set light(Light? value) {
    _checkNotFrozen();
    _light = value;
  }

  Map<String, Object?>? get metadata => _metadata;
  Map<String, Object?>? _metadata;

  set metadata(Map<String, Object?>? value) {
    _checkNotFrozen();
    _metadata = value;
  }

  String? get name => _name;
  String? _name;

  set name(String? value) {
    _checkNotFrozen();
    _name = value;
  }

  num? get pitch => _pitch;
  num? _pitch;

  set pitch(num? value) {
    _checkNotFrozen();
    _pitch = value;
  }

  Projection? get projection => _projection;
  Projection? _projection;

  set projection(Projection? value) {
    _checkNotFrozen();
    _projection = value;
  }

  Sources? get sources => _sources;
  Sources? _sources;

  set sources(Sources? value) {
    _checkNotFrozen();
    _sources = value;
  }

  String? get sprite => _sprite;
  String? _sprite;

  set sprite(String? value) {
    _checkNotFrozen();
    _sprite = value;
  }

  Terrain? get terrain => _terrain;
  Terrain? _terrain;

  set terrain(Terrain? value) {
    _checkNotFrozen();
    _terrain = value;
  }

  Transition? get transition => _transition;
  Transition? _transition;

  set transition(Transition? value) {
    _checkNotFrozen();
    _transition = value;
  }

  Version? get version => _version;
  Version? _version;

  set version(Version? value) {
    _checkNotFrozen();
    _version = value;
  }

  num? get zoom => _zoom;
  num? _zoom;

  set zoom(num? value) {
    _checkNotFrozen();
    _zoom = value;
  }

  @override
  Style copy() => Style(
        bearing: _bearing,
        center: () {
          final value = _center;
          if (value != null) {
            return List<num>.of(value);
          }
        }(),
        fog: () {
          final value = _fog;
          if (value != null) {
            return value.copy();
          }
        }(),
        glyphs: _glyphs,
        layers: () {
          final value = _layers;
          if (value != null) {
            return <Layer>[
              for (final element in value) element.copy(),
            ];
          }
        }(),
        light: () {
          final value = _light;
          if (value != null) {
            return value.copy();
          }
        }(),
        metadata: () {
          final value = _metadata;
          if (value != null) {
            return <String, Object?>{
              for (final entry in value.entries)
                entry.key: () {
                  final value = entry.value;
                  if (value != null) {
                    return _copyJson(value, immutable: false);
                  }
                }(),
            };
          }
        }(),
        name: _name,
        pitch: _pitch,
        projection: () {
          final value = _projection;
          if (value != null) {
            return value.copy();
          }
        }(),
        sources: () {
          final value = _sources;
          if (value != null) {
            return value.copy();
          }
        }(),
        sprite: _sprite,
        terrain: () {
          final value = _terrain;
          if (value != null) {
            return value.copy();
          }
        }(),
        transition: () {
          final value = _transition;
          if (value != null) {
            return value.copy();
          }
        }(),
        version: _version,
        zoom: _zoom,
      );

  @override
  void freeze() {
    _center = () {
      final value = _center;
      if (value != null) {
        return List<num>.unmodifiable(value);
      }
    }();
    () {
      final value = _fog;
      if (value != null) {
        value.freeze();
      }
    }();
    _layers = () {
      final value = _layers;
      if (value != null) {
        return () {
          for (final element in value) {
            element.freeze();
          }
          return List<Layer>.unmodifiable(value);
        }();
      }
    }();
    () {
      final value = _light;
      if (value != null) {
        value.freeze();
      }
    }();
    _metadata = () {
      final value = _metadata;
      if (value != null) {
        return <String, Object?>{
          for (final entry in value.entries)
            entry.key: () {
              final value = entry.value;
              if (value != null) {
                return _copyJson(value, immutable: true);
              }
            }(),
        };
      }
    }();
    () {
      final value = _projection;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _sources;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _terrain;
      if (value != null) {
        value.freeze();
      }
    }();
    () {
      final value = _transition;
      if (value != null) {
        value.freeze();
      }
    }();
    super.freeze();
  }

  @override
  Map<String, Object?> toJson() => {
        if (_bearing != null) 'bearing': _bearing!,
        if (_center != null) 'center': _center!,
        if (_fog != null) 'fog': _fog!.toJson(),
        if (_glyphs != null) 'glyphs': _glyphs!,
        if (_layers != null)
          'layers': <Object?>[
            for (final element in _layers!) element.toJson(),
          ],
        if (_light != null) 'light': _light!.toJson(),
        if (_metadata != null) 'metadata': _metadata!,
        if (_name != null) 'name': _name!,
        if (_pitch != null) 'pitch': _pitch!,
        if (_projection != null) 'projection': _projection!.toJson(),
        if (_sources != null) 'sources': _sources!.toJson(),
        if (_sprite != null) 'sprite': _sprite!,
        if (_terrain != null) 'terrain': _terrain!.toJson(),
        if (_transition != null) 'transition': _transition!.toJson(),
        if (_version != null) 'version': _version!.toJson(),
        if (_zoom != null) 'zoom': _zoom!,
      };

  static Style? fromJson(DataContext context) {
    final value = context.value;
    if (value is! Map<String, Object?>) {
      context._recordException(
        DataException('Expected value of type Map<String, Object?>.'),
      );
      return null;
    }

    final map = Map.of(value);
    final result = Style();
    if (map.containsKey('bearing')) {
      result._bearing = _parseDataProperty(
        context,
        'bearing',
        map.remove('bearing'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('center')) {
      result._center = _parseDataProperty(
        context,
        'center',
        map.remove('center'),
        (context) => _parseArray<num>(
          context,
          (context) => _parseAsType<num>(context),
        ),
      );
    }
    if (map.containsKey('fog')) {
      result._fog = _parseDataProperty(
        context,
        'fog',
        map.remove('fog'),
        (context) => Fog.fromJson(context),
      );
    }
    if (map.containsKey('glyphs')) {
      result._glyphs = _parseDataProperty(
        context,
        'glyphs',
        map.remove('glyphs'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('layers')) {
      result._layers = _parseDataProperty(
        context,
        'layers',
        map.remove('layers'),
        (context) => _parseArray<Layer>(
          context,
          (context) => Layer.fromJson(context),
        ),
      );
    }
    if (map.containsKey('light')) {
      result._light = _parseDataProperty(
        context,
        'light',
        map.remove('light'),
        (context) => Light.fromJson(context),
      );
    }
    if (map.containsKey('metadata')) {
      result._metadata = _parseDataProperty(
        context,
        'metadata',
        map.remove('metadata'),
        (context) => _parseStringMap<Object?>(
          context,
          (context) =>
              context.value == null ? null : _parseAsType<Object>(context),
        ),
      );
    }
    if (map.containsKey('name')) {
      result._name = _parseDataProperty(
        context,
        'name',
        map.remove('name'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('pitch')) {
      result._pitch = _parseDataProperty(
        context,
        'pitch',
        map.remove('pitch'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.containsKey('projection')) {
      result._projection = _parseDataProperty(
        context,
        'projection',
        map.remove('projection'),
        (context) => Projection.fromJson(context),
      );
    }
    if (map.containsKey('sources')) {
      result._sources = _parseDataProperty(
        context,
        'sources',
        map.remove('sources'),
        (context) => Sources.fromJson(context),
      );
    }
    if (map.containsKey('sprite')) {
      result._sprite = _parseDataProperty(
        context,
        'sprite',
        map.remove('sprite'),
        (context) => _parseAsType<String>(context),
      );
    }
    if (map.containsKey('terrain')) {
      result._terrain = _parseDataProperty(
        context,
        'terrain',
        map.remove('terrain'),
        (context) => Terrain.fromJson(context),
      );
    }
    if (map.containsKey('transition')) {
      result._transition = _parseDataProperty(
        context,
        'transition',
        map.remove('transition'),
        (context) => Transition.fromJson(context),
      );
    }
    if (map.containsKey('version')) {
      result._version = _parseDataProperty(
        context,
        'version',
        map.remove('version'),
        (context) => _parseFromJsonAsVersion(context),
      );
    }
    if (map.containsKey('zoom')) {
      result._zoom = _parseDataProperty(
        context,
        'zoom',
        map.remove('zoom'),
        (context) => _parseAsType<num>(context),
      );
    }
    if (map.isNotEmpty) {
      context._recordException(
        DataException('Unexpected properties: ${map.keys}'),
      );
    }
    return result;
  }
}
