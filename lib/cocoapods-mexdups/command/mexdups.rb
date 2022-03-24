module Pod
  class Command
    # This is an example of a cocoapods plugin adding a top-level subcommand
    # to the 'pod' command.
    #
    # You can also create subcommands of existing or new commands. Say you
    # wanted to add a subcommand to `list` to show newly deprecated pods,
    # (e.g. `pod list deprecated`), there are a few things that would need
    # to change.
    #
    # - move this file to `lib/pod/command/list/deprecated.rb` and update
    #   the class to exist in the the Pod::Command::List namespace
    # - change this class to extend from `List` instead of `Command`. This
    #   tells the plugin system that it is a subcommand of `list`.
    # - edit `lib/cocoapods_plugins.rb` to require this file
    #
    # @todo Create a PR to add your plugin to CocoaPods/cocoapods.org
    #       in the `plugins.json` file, once your plugin is released.
    #
    class Mexdups < Command

      require 'fileutils'
      require 'find'

      self.summary = '根据pod组件移除壳工程中的重复文件,先输入pod文件夹，再输入工程文件夹'

      self.description = <<-DESC
        指定Pod目录和壳工程目录,搜索并移除壳工程目录已存在的重复文件
      DESC

      # 接收两个目录路径
      def initialize(argv)
        @pod_folder = argv.shift_argument
        @shell_folder = argv.shift_argument
        super
      end

      def validate!
        super
        help! 'pod folder is required.' unless @pod_folder
        help! 'shell folder is required.' unless @shell_folder
      end

      def run
        # FileUtils.rm_r 'Pods', :force => true
        # TOOD: 列举pod folder中的所有文件名

        pod_file_map = {}

        Find.find(@pod_folder) do |path|
          unless Dir.exist? path
            pod_file_map[(File.basename path)] = true
          end
        end

        Find.find(@shell_folder) do |path|
          unless Dir.exist? path
            file_name = File.basename(path)
            if pod_file_map[file_name] == true
              UI.puts "发现重复文件 #{file_name}"
              FileUtils.rm_f path
            end
          end
        end

      end
      
    end
  end
end
